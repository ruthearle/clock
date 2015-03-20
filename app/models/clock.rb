require 'mongoid'

class Clock

    include Mongoid::Document

    field :time, type: Time, default: lambda{ Time.now }

    def self.check
        #if self.exists?
            #clock = Clock.last
        #else
            #clock = Clock.new
        #end
        self.exists? ? clock = Clock.last : clock = Clock.new
        clock
    end
end
