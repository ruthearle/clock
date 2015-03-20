require 'grape'
require 'grape-swagger'
require_relative './models/clock'

module TimeMachine

    class API < Grape::API

      format :json
      resource :api do

        desc "Returns the current time."

        params do
            requires :service_id, type: String, desc: "ID of the service requesting the time. Use 'default' if you have not created a clock yet."
        end

        get :time do
          clock = Clock.check(params[:service_id])
          { :time => clock.time.iso8601 }
        end

        params do
          requires :new, type: String, desc: "Updated time"
          requires :service_id, type: String, desc: "Enter the name of the micro-service"
        end

        desc "Permits the time to be altered"
        put ':time' do
          clock = Clock.check(params[:service_id])
          clock.time = (params[:new])
          clock.service_id = params[:service_id]
          clock.save
          { :time => clock.time.iso8601, :service_id => clock.service_id }
        end

      add_swagger_documentation

      end

    end
end
