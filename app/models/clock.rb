require 'mongoid'

class Clock

    include Mongoid::Document
    Mongoid.raise_not_found_error = false

    field :time, type: Time, default: lambda{ Time.now }
    field :service_id, type: String, default: "default"

    def self.check(identity)
      id = format(identity)
      clock = Clock.find_by(service_id: id)
      #id == "default" ? Clock.new : Clock.find_by(service_id: id)
      if id == "default"
        clock = Clock.new
      elsif clock == nil
          clock = Clock.new
      else
        clock = Clock.find_by(service_id: id)
      end
      clock
    end

    def format(string)
      string.slice(1..-2)
    end

end
