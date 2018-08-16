struct Time::Interval
  @months : Int32
  @days : Int32

  def initialize(years : Int32, months : Int32, days : Int32)
    @months = years * 12 + months
    @days = days
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
end
