require 'time_machine'
require 'rack/test'

describe TimeMachine::API do
  include Rack::Test::Methods

  def app
    TimeMachine::API
  end

  describe TimeMachine::API do
    describe "GET /api/time" do

      it 'returns the time in JSON format' do
        get "api/time"
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ :time => /\d{4}\W\d{2}\W\d{2}\s\d{2}\W\d{2}\W\d{2}\s\W\d{4} })
      end
    end
  end
end
