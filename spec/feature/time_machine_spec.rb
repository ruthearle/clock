require 'spec_helper'
require './app/time_machine'

describe TimeMachine::API do
  include Rack::Test::Methods

  def app
    TimeMachine::API
  end

  describe TimeMachine::API do

    let (:service_id)   { "default" }
    let (:current_time) { Time.now }
    let (:new_time)     { Time.now + 3600 }

    describe "GET /api/time" do

      it "returns the time in JSON format for any service" do
        allow(Time).to receive(:now).and_return(new_time)
        get "api/time", { "service_id" => service_id }
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{Time.now.iso8601}" })
      end
    end

    describe "PUT /api/time" do

      it "allows a micro-service to alter the time" do
        service_id = :QA
        put "api/time", { "new" => new_time, "service_id" => service_id }
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to include ({ "time" => "#{new_time.iso8601}", "service_id" => "#{service_id}" })
        #expect(JSON.parse(last_response.body)).to include ({  })

        get "api/time", { "service_id" => service_id}
        expect(JSON.parse(last_response.body)).to include ({ "time" => "#{new_time.iso8601}" })
      end
    end
  end
end
