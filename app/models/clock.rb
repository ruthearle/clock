require 'mongoid'

class Clock

    include Mongoid::Document
    Mongoid.raise_not_found_error = false

    field :time, type: Time, default: lambda{ Time.now }
    field :service_id, type: String, default: "time machine"

    def self.check(id)
      (id == "time machine") ? clock = Clock.new : clock = Clock.find_by(service_id: id)
    end

end
