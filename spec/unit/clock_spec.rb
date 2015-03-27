require 'spec_helper'
require './app/models/clock'

describe Clock do

  describe "#check" do

    it "finds a clock by their service id" do
      object = Clock.new
      object.service_name = "rspec"
      object.save
      object_2 = Clock.new
      object_2.save
      id = object.service_name
      expect(Clock.check(id)).to eq object
    end

    it "creates a new clock with the named service provided" do
      object = Clock.new
      object.service_name = "ruth"
      object.time = Time.now
      object.fake_time = "nil"
      object.save
      id = object.service_name
      expect(Clock.check(id)).to eq object
    end
  end
end
