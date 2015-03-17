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
        @the_time = Time.now + 3600
        Timecop.freeze(@the_time)
      end

      after do
        Timecop.return
      end

      it 'returns the time in JSON format' do
        get "api/time"
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{@the_time}" })
      end

      it 'returns the current time for each request' do
        @current_time = Time.now
        get "api/time"
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{@the_time}" })
        sleep 2
        get "api/time"
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

      it "allows a user to alter the time" do
        @current_time = Time.now
        get "api/time"
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{@current_time}" })

        put "api/time", { "new" => @new_time }
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{@new_time}" })

        get "api/time"
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{@new_time}" })
      end
    end
  end
end
