require "minitest/autorun"

require "/../src/time_ext.cr"

class IntervalTest < Minitest::Test
  def test_hour_minute_second_initializer
    interval = Time::Interval.new(5, 3, 20)
    assert_equal 5, interval.hours
    assert_equal 3, interval.minutes
    assert_equal 20, interval.seconds
  end

  def test_full_initializer
    interval = Time::Interval.new(3, 5, 18, 12, 15, 30)
    assert_equal 3, interval.years
    assert_equal 5, interval.months
    assert_equal 18, interval.days
    assert_equal 12, interval.hours
    assert_equal 15, interval.minutes
    assert_equal 30, interval.seconds
  end
end
