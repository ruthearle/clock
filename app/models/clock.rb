require 'mongoid'

class Clock

    include Mongoid::Document
    Mongoid.raise_not_found_error = false

    field :time, type: Time, default: lambda{ Time.now }
    field :service_id, type: String, default: "default"

    def self.check(identity)
      id = format(identity)
      clock = Clock.find_by(service_id: id)

      (id == "default") || (clock == nil) ? clock = Clock.new : clock = Clock.find_by(service_id: id)

      clock
    end

    def format(string)
      string.slice(1..-2)
    end

end
