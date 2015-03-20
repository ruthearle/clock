require 'spec_helper'
require './app/models/clock'

describe Clock do

  describe "#check" do

    it "finds a clock by their service id" do
      object = Clock.new
      object.service_id = "rspec"
      object.save
      object_2 = Clock.new
      object_2.save
      id = object.service_id
      expect(Clock.check(id)).to eq object
    end

    it "creates a new clock if none exists" do
      id = "default"
      object = Clock.new
      object.save
      expect(Clock.check(id)).to eq object
    end

  end
end
