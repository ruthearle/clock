class ApiTime

  # attr_accessor :the_time

  def self.the_time
    @the_time
  end

  def self.get
    the_time ||= Time.now
  end

  def self.update(time)
    @the_time = time
  end

end
