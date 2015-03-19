require 'mongoid'

class Clock

    include Mongoid::Document

    field :time, type: Time, default: lambda{ Time.now }

    def clock_check
        if Clock.exists?
            clock = Clock.last
        else
            false
        end
    end
end
