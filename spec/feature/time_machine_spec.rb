require 'spec_helper'
require './app/time_machine'

describe TimeMachine::API do
  include Rack::Test::Methods

  def app
    TimeMachine::API
  end

  describe TimeMachine::API do

    let (:current_time) { Time.now }
    let (:new_time)     { Time.now + 3600 }

    describe "GET /api/time" do

      it 'returns the time in JSON format' do
        allow(Time).to receive(:now).and_return(new_time)
        get "api/time"
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{Time.now.utc.iso8601}" })
      end

      it 'returns the current time for each request' do
        allow(Time).to receive(:now).and_return(new_time)

        get "api/time"
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{Time.now}" })

        #sleep 2

        allow(Time).to receive(:now).and_return(current_time)

        get "api/time"
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{Time.now}" })
      end
    end

    describe "PUT /api/time" do

      it "allows a user to alter the time" do
        get "api/time"
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{current_time}" })

        put "api/time", { "new" => new_time }
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{new_time}" })

        get "api/time"
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{new_time}" })
      end
    end
  end
end
