require 'spec_helper'
require './app/models/clock'

describe Clock do

  describe "#check" do

    xit "finds the last created clock, if it exists" do
        object = Clock.new
        object.time = Time.now
        #object.save
        id = object.id
        expect(Clock.check(id)).to eq object
    end

    it "finds a clock by their id" do
      object = Clock.new
      object.save
      object_2 = Clock.new
      object_2.save
      id = object.id
      expect(Clock.check(id)).to eq object
    end

    it "creates a new clock if none exists" do
        expect(Clock.check(id)).to be_truthy
    end

  end
end
