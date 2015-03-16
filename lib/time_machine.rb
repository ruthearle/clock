require 'grape'
require_relative './api_time'

module TimeMachine

    class API < Grape::API

      format :json

      resource :api do

        desc "Returns the current time."
        get :time do
          ApiTime.get
        end

      end

    end

end
