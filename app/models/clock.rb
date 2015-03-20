require 'mongoid'

class Clock

    include Mongoid::Document

    field :time, type: Time, default: lambda{ Time.now }
    field :service_id, type: String, default: "default"

    def self.check(identity)
      id = format(identity)
      id != "default" ? clock = Clock.find_by(service_id: id) : clock = Clock.new
        return clock
    end

    private
    def format(identity)
      id.slice(1..-2)
    end
end
