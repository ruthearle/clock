require 'mongoid'

class Clock

    include Mongoid::Document

    field :time, type: Time, default: lambda{ Time.now }

    def self.check(id)
        #self.exists? ? clock = Clock.last : clock = Clock.new
        clock = self.find(id)
        clock
    end
end
