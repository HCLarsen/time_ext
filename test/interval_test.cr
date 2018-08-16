require "minitest/autorun"

require "/../src/time_ext.cr"

class IntervalTest < Minitest::Test
  def test_full_initializer
    interval = Time::Interval.new(3, 5, 18)
    assert_equal 3, interval.years
    assert_equal 5, interval.months
    assert_equal 18, interval.days
  end
end
