require 'spec_helper'
require './app/models/clock'

describe Clock do

  describe "#check" do

    it "finds the clock object if it exists" do
        object = Clock.new
        object.time = Time.now
        object.save
        expect(Clock.check).to eq object
    end

    it "makes a new clock object if none exists" do
        expect(Clock.check).to be_truthy

    end

  end
end
