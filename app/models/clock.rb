require 'mongoid'

class Clock

    include Mongoid::Document
    Mongoid.raise_not_found_error = false

    field :time, type: Time, default: lambda{ Time.now }
    field :service_name, type: String

    def self.check(id)
      clock = Clock.find_by(service_name: id)

      if (clock == nil)
          clock = Clock.new
          clock.service_name = id
          clock.save
          clock
      else
          clock
      end
    end

end
