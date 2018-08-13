struct Time::Interval
  @months : Int32
  @days : Int32
  @seconds : Int32

  def initialize(years : Int32, months : Int32, days : Int32, hours : Int32, minutes : Int32, seconds : Int32)
    @months = years * 12 + months
    @days = days
    @seconds = hours * 3600 + minutes * 60 + seconds
  end

  def initialize(hours : Int32, minutes : Int32, seconds : Int32)
    @seconds = hours * 3600 + minutes * 60 + seconds
    @months = 0
    @days = 0
  end

  def years
    @months / 12
  end

  def months
    @months % 12
  end

  def days
    @days
  end

  def hours
    @seconds / 3600
  end

  def minutes
    @seconds % 3600 / 60
  end

  def seconds
    @seconds % 60
  end
end
