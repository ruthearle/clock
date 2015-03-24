require 'grape'
require 'grape-swagger'
require_relative './models/clock'

module TimeMachine

    class API < Grape::API

      format :json
      resource :api do

        desc "Returns the current time or the time saved by the named micro-service."

        params do
            optional :service_id, type: String, default: "time machine", desc: "Enter the name of the service if one has been previously saved."
        end

        get :time do
          clock = Clock.check(params[:service_id])

          (clock == nil) ? error!("No resource found!", 404) : { :time => clock.time.iso8601 }
        end

        params do
          requires :new, type: String, desc: "Updated time"
          requires :service_id, type: String, desc: "Enter the name of the micro-service"
        end

        desc "Permits the time to be altered"
        put ':time' do
          clock = Clock.check(params[:service_id])
          (clock == nil) ? clock = Clock.new : clock

          clock.time = (params[:new])
          clock.service_id = (params[:service_id])
          clock.save

          { :time => clock.time.iso8601, :service_id => clock.service_id }
        end

      add_swagger_documentation

      end

    end
end
