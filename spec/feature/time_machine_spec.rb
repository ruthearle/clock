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

    let (:id)               { "development" }
    let (:current_time)     { Time.now }
    let (:new_time)         { Time.now + 3600 }
    let (:service)          { Clock.new }
    let (:status_ok)        { 200 }
    let (:status_not_found) { 404 }
    let (:formatted_time)   { Time.now.iso8601 }

    describe "GET /api/time" do

      it "returns the time in JSON format by default" do
        stub_time(new_time)
        get "api/time"
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{Time.now.iso8601}" })
      end

      it "returns a 404 Not Found if the service id is not found or mispelt" do
        service_id = "none"
        stub_time(current_time)
        get_request_status(service_id, status_not_found)
        expect(JSON.parse(last_response.body)).to eq ({ "error" => "No resource found!" })
      end

      it "returns the time set by the micro-service being queried" do
        saved_service(id)
        stub_time(current_time)

        get_request_status(id, status_ok)

        expect(JSON.parse(last_response.body)).to include ({ "time" => "#{Time.now.iso8601}" })
      end
    end

    describe "PUT /api/time" do

      it "allows a micro-service to create a new service and alter the time" do
        service_id = "QA"

        get_request_status(service_id, status_not_found)

        stub_time(new_time)

        put_response_body(new_time, service_id, status_ok, formatted_time)

        get_response_body(service_id, status_ok, formatted_time)

      end

      it "allows a micro-service to alter the time of a previously created service" do

        stub_time(new_time)

        saved_service(id)

        get_request_status(id, status_ok)

        put_response_body(new_time, id, status_ok, formatted_time)

        get_response_body(id, status_ok, formatted_time)

      end
    end
  end
end
