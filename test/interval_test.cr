require "minitest/autorun"

require "/../src/time_ext.cr"

class IntervalTest < Minitest::Test
  def test_full_initializer
    interval = Time::Interval.new(3, 5, 18)
    assert_equal 3, interval.years
    assert_equal 5, interval.months
    assert_equal 18, interval.days
  end

  def test_days_int_method
    days = 20.days
    assert_equal Time::Interval.new(0, 0, 20), days
  end

  def test_weeks_int_method
    weeks = 4.weeks
    assert_equal Time::Interval.new(0, 0, 28), weeks
  end

  def test_months_int_method
    months = 6.months
    assert_equal Time::Interval.new(0, 6, 0), months
  end

  def test_years_int_method
    years = 10.years
    assert_equal Time::Interval.new(10, 0, 0), years
  end
end
