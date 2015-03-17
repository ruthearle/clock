require 'grape'
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
          ApiTime.update(params[:new])
        end

      end

    end

end
