require 'grape'
require 'grape-swagger'
require_relative './models/clock'

module TimeMachine

    class API < Grape::API
      class << self
        Grape::Route
        def fix_swagger_param_type()
          @combined_routes.each do |resource, routes|
            routes.each do |route|
              if route.route_params
                route.route_params.each do |param_name, param_attrs|
                  # grape-swagger is looking for param_type in route.route_params[<param_name>][:param_type]
                  # but Grape::Route only save :required, :type, :desc, :default, :values, :documentation
                  # so :documentation is the only hash it can get in.
                  # ideally, grape-swagger should look for [:documentation][:param_type] instead of [:param_type]
                  # But until that's fixed, this is a temporary fix.
                  if param_attrs.is_a?(Hash) && param_attrs.key?(:documentation) &&
                      param_attrs[:documentation].key?(:param_type)
                    param_attrs[:param_type] = param_attrs[:documentation][:param_type]
                  end
                end
              end
            end
          end
        end
      end

      resource "/clocks" do

        desc "Returns the current time or the time saved by the named micro-service."

        params do
            optional :service_name, type: String, desc: "Enter the name of the service."
        end

        get ":service_name" do
          clock = Clock.check(params[:service_name])

          { :id => clock.id.to_s, :time => clock.time.utc.iso8601, :service_name => clock.service_name }
        end

        desc "Permits the time to be altered"

        params do
          requires :time, type: String, documentation: {param_type: 'query'}, desc: "Updated time in ISO8601-UTC format"
          requires :service_name, type: String,  desc: "Enter the name of the service"

        end

        post ":service_name" do
          clock = Clock.check(params[:service_name])
          (clock == nil) ? clock = Clock.new : clock

          clock.time = (params[:time])
          clock.service_name = (params[:service_name])
          clock.save

          request.url
          #{ :id => clock.id.to_s, :time => clock.time.utc.iso8601, :service_name => clock.service_name }
        end

      add_swagger_documentation :hide_documentation_path => true
      fix_swagger_param_type
      end

    end
end
