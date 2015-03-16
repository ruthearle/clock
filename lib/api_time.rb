class ApiTime

  attr_accessor :the_time

  def self.get

    @the_time = Time.now

    { :time => @the_time }
  end

  def self.update(time)
    @the_time = time
  end

  def self.the_time
    @the_time
  end
end
