require 'spec_helper'
require './app/time_machine'

describe TimeMachine::API do
  include Rack::Test::Methods

  def app
    TimeMachine::API
  end

  describe TimeMachine::API do

    describe "GET /api/time" do

      before do
        @current_time = Time.now + 3600
        Timecop.freeze(@current_time)
      end

      after do
        Timecop.return
      end

      it 'returns the time in JSON format' do
        get "api/time"
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{@current_time}" })
      end
    end

    describe "PUT /api/time" do

      before do
        @new_time = Time.now + 3600
        Timecop.freeze(@new_time)
      end

      after do
        Timecop.return
      end

      new_time = { "new" => @new_time }

      request_headers = {
       "Accept" => "application/json",
       "Content-Type" => "application/json"
      }

      it "allows a user to alter the time" do
        put "api/time", new_time, request_headers
        expect(last_response.status).to eq 200
        expect(ApiTime.get).to eq @new_time
      end
    end
  end
end
