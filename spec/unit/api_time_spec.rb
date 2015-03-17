require 'spec_helper'
require './app/lib/api_time'

describe ApiTime do

  describe "#get" do
    it "returns the current time" do
      current_time = Time.now
      allow(Time).to receive(:now).and_return(current_time)
      expect(ApiTime.get).to match Time.now
    end

    it "returns the current time or the adjusted time" do
      current_time = Time.now
      allow(Time).to receive(:now).and_return(current_time)
      expect(ApiTime.get).to match Time.now

      time = (Time.now + 3600)
      ApiTime.update(time)
      expect(ApiTime.get).to match time
    end
  end

  describe "#update" do
    before do
      @updated_time = Time.now + 3600
      Timecop.freeze(@updated_time)
    end

    after do
      Timecop.return
    end

    it "allows the current time to be changed" do
      ApiTime.update(@updated_time)
      expect(ApiTime.get).to match @updated_time
    end
  end
end
