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
      expect(ApiTime.get).to match @the_time
    end
  end

  describe "#update" do

    before do
      @the_time = Time.now + 3600
      Timecop.freeze(@the_time)
    end

    after do
      Timecop.return
    end

    it "allows the current time to be changed" do
      ApiTime.update(@the_time)
      expect(ApiTime.get).to match @the_time
    end
  end
end
