class ApiTime

  def self.get

    @the_time = Time.now

    { :time => @the_time }

  end
end
