require 'api_time'
require 'timecop'

describe ApiTime do
  describe "#get" do

    before do
      @the_time = Time.now
      Timecop.freeze(@the_time)
    end

    after do
      Timecop.return
    end

    it "returns the current time" do
      expect(ApiTime.get).to match ({ :time => @the_time })
    end
  end
end
