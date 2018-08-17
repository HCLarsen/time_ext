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

struct Int
  def days : Time::Interval
    Time::Interval.new(0, 0, self)
  end

  def weeks
    Time::Interval.new(0, 0, self * 7)
  end

  def months
    Time::Interval.new(0, self, 0)
  end

  def years
    Time::Interval.new(self, 0, 0)
  end
end
