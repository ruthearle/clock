require 'grape'
require 'grape-swagger'
require_relative './models/clock'

module TimeMachine

    class API < Grape::API

      format :json
      resource :api do

        desc "Returns the current time."
        get :time do
            #if cookies?
            clock = Clock.check
            { :time => clock.time.iso8601 }
        end

        params do
          requires :new, type: Time, desc: "Updated time"
        end

        desc "Permits the time to be altered"
        put ':time' do
            clock = Clock.new
            clock.time = (params[:new])
            clock.save!
            cookies[:id] = clock.id
            { :time => clock.time.iso8601  }
        end

      add_swagger_documentation

      end

    end
end
