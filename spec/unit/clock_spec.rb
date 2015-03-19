require 'spec_helper'
require './app/models/clock'

describe Clock do

  describe "#clock_check" do
    it "queries the database for any existing clock objects" do
        expect(Clock.new.clock_check).to eq false
    end

    it "finds the clock object if it exists" do
        object = Clock.new
        object.time = Time.now
        object.save
        expect(Clock.new.clock_check).to eq object
    end
  end
end
