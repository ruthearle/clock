require 'spec_helper'
require './app/time_machine'
require './app/models/clock'
require_relative '../helpers/saved_service'

describe TimeMachine::API do
  include Rack::Test::Methods

  def app
    TimeMachine::API
  end

  describe TimeMachine::API do

    let (:service_name)     { "development" }
    let (:current_time)     { Time.now }
    let (:new_time)         { Time.now + 3600 }
    let (:status_ok)        { 200 }
    let (:status_created)   { 201 }
    let (:status_not_found) { 404 }
    let (:formatted_time)   { Time.now.utc.iso8601 }

    describe "GET /clocks" do

      it "returns the time in JSON format for a new service id" do
        stub_time(new_time)
        get "/clocks/#{service_name}.json"
        expect(last_response.status).to eq status_ok
        expect(JSON.parse(last_response.body)).to include ({ "time" => "#{formatted_time}", "service_name" => "development" })
      end

      it "returns the current time if the named micro-service has not been saved" do
        stub_time(current_time)
        get "/clocks/test.json"
        expect(last_response.status).to eq status_ok
        expect(JSON.parse(last_response.body)).to include ({ "time" => "#{formatted_time}", "service_name" => "test"})

        stub_time(new_time)
        get "clocks/test.json"
        expect(last_response.status).to eq status_ok
        expect(JSON.parse(last_response.body)).to include ({ "time" => "#{formatted_time}", "service_name" => "test"})
      end


      it "returns the time set by the micro-service being queried" do
        saved_service(service_name)
        stub_time(current_time)

        get_request_status(service_name, status_ok)

        expect(JSON.parse(last_response.body)).to include ({ "time" => "#{formatted_time}" })
      end
    end

    describe "POST /clocks" do

      it "allows a micro-service to create a new service and alter the time" do
        service_name = "QA"

        #get_request_status(service_name, status_not_found)

        stub_time(new_time)

        post_response_body(new_time, service_name, status_created, formatted_time)

        get_response_body(service_name, status_ok, formatted_time)

      end

      it "allows a micro-service to alter the time of a previously created service" do

        stub_time(new_time)

        saved_service(service_name)

        get_request_status(service_name, status_ok)

        post_response_body(new_time, service_name, status_created, formatted_time)

        get_response_body(service_name, status_ok, formatted_time)

      end
    end

  end
end
