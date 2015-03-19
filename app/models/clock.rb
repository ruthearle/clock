require 'mongoid'

class Clock

    include Mongoid::Document

    field :time, type: Time, default: lambda{ Time.now }

end
