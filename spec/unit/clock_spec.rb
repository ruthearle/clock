require 'spec_helper'
require './app/models/clock'

describe Clock do

  describe "#clock_check" do
    it "queries the database for any existing clock objects" do
        db = Clock.new
        expect(db.clock_check).to eq false
    end
  end
end
