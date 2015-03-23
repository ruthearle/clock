require 'mongoid'

class Clock

    include Mongoid::Document
    Mongoid.raise_not_found_error = false

    field :time, type: Time, default: lambda{ Time.now }
    field :service_id, type: String, default: "time machine"

    def self.check(id)
      #id = format(identity)
      clock = Clock.find_by(service_id: id)
      if id == "time machine"
          clock = Clock.new
      elsif clock == nil
          clock = nil
      else
          clock = Clock.find_by(service_id: id)

      end

      #(id == "time_machine") || (clock == nil) ? clock = Clock.new : clock = Clock.find_by(service_id: id)

      clock
    end

    #def format(string)
      #string.slice(1..-2)
    #end

end
