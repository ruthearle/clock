require 'grape'
require 'grape-swagger'
require_relative './lib/api_time'
require_relative './models/clock'

module TimeMachine

    class API < Grape::API

      format :json
      resource :api do

        desc "Returns the current time."
        get :time do

          clock = Clock.create!
          cookies[:id] = clock.id
          { :time => clock.time.iso8601 }
          p clock.id
        end

        params do
          requires :new, type: Time, desc: "Updated time"
        end

        desc "Permits the time to be altered"
        put ':time' do
            { :time => ApiTime.new.update(params[:new]) }
        end

      add_swagger_documentation

      end

    end
end
