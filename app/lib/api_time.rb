class ApiTime

  def self.get
    @the_time ||= Time.now
  end

  def self.update(time)
    @the_time = time
  end

end
