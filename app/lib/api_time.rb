class ApiTime

  attr_accessor :the_time

  def get
      @the_time || Time.now

  end

  def update(time)
    @the_time = time
  end

end
