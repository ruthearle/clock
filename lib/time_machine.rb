require 'grape'
require_relative './api_time'

module TimeMachine

    class API < Grape::API

      format :json

      resource :api do

        desc "Returns the current time."
        get :time do
          { :time => ApiTime.get }
        end

        params do
          requires :the_time, type: String, desc: "Updated time"
        end
        put ':the_time' do
          ApiTime.update(params[:the_time])
        end

      end

    end

end
