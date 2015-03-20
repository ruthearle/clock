require 'mongoid'

class Clock

    include Mongoid::Document

    field :time, type: Time, default: lambda{ Time.now }

    def self.check(_id)
        #self.exists? ? clock = Clock.last : clock = Clock.new
        clock = self.find(_id)
        clock
    end
end
