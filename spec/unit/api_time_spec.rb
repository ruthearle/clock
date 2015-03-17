require 'spec_helper'
require './app/lib/api_time'

describe ApiTime do

  describe "#get" do

    before do
      @current_time = Time.now + 3600
      Timecop.freeze(@current_time)
    end

    after do
      Timecop.return
    end

    it "returns the current time" do
      expect(ApiTime.get).to match @current_time
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
