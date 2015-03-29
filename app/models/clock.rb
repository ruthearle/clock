require 'mongoid'

class Clock

  include Mongoid::Document
  Mongoid.raise_not_found_error = false

  field :service_name, type: String
  field :real_time, type: Time, default: lambda{ Time.now }
  field :fake_time, type: Time, default: "1970-01-01T00:00:00Z"

  def self.check(id)
    clock = Clock.find_by(service_name: id)

    if (clock == nil)
      clock = Clock.new
      clock.service_name = id
      clock.save
    else
      clock
    end
    clock
  end

end
