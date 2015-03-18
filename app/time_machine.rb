require 'grape'
require 'grape-swagger'
require_relative './lib/api_time'

module TimeMachine

    class API < Grape::API

      format :json

      resource :api do

        desc "Returns the current time."
        get :time do
          { :time => ApiTime.get }
        end

        params do
          requires :new, type: Time, desc: "Updated time"
        end
        put ':time' do
          { :time => ApiTime.update(params[:new]) }
        end

      end

    add_swagger_documentation
    end
end
