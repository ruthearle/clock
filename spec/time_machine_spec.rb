require 'time_machine'
require 'rack/test'
require 'timecop'

describe TimeMachine::API do
  include Rack::Test::Methods

  def app
    TimeMachine::API
  end

  before do
    @the_time = Time.now
    Timecop.freeze(@the_time)
  end

  after do
    Timecop.return
  end

  describe TimeMachine::API do
    describe "GET /api/time" do

      it 'returns the time in JSON format' do
        get "api/time"
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq ({ "time" => "#{@the_time}" })
      end
    end
  end
end
