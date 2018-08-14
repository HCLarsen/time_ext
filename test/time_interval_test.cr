require "minitest/autorun"

require "/../src/time_ext.cr"

class TimeIntervalTest < Minitest::Test
  def test_adds_years
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(4, 0, 0, 0, 0, 0)
    assert_equal Time.new(2022, 8, 13, 15, 0, 0), time + interval
  end

  def test_subtracts_years
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(4, 0, 0, 0, 0, 0)
    assert_equal Time.new(2014, 8, 13, 15, 0, 0), time - interval
  end

  def test_adds_days
    time = Time.new(2018, 6, 30, 15, 0, 0)
    interval = Time::Interval.new(0, 0, 1, 0, 0, 0)
    assert_equal Time.new(2018, 7, 1, 15, 0, 0), time + interval
  end

  def test_adds_months
    time = Time.new(2018, 6, 30, 15, 0, 0)
    interval = Time::Interval.new(0, 1, 0, 0, 0, 0)
    assert_equal Time.new(2018, 7, 30, 15, 0, 0), time + interval
  end

  def test_corrects_for_shorter_months
    time = Time.new(2018, 10, 31, 15, 0, 0)
    interval = Time::Interval.new(0, 1, 0, 0, 0, 0)
    assert_equal Time.new(2018, 11, 30, 15, 0, 0), time + interval
  end

  def test_corrects_hours_over_24
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(10, 0, 0)
    assert_equal Time.new(2018, 8, 14, 1, 0, 0), time + interval
  end

  def test_subtracts_hours
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(10, 0, 0)
    assert_equal Time.new(2018, 8, 13, 5, 0, 0), time - interval
  end

  def test_corrects_negative_months
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(0, 10, 0, 0, 0, 0)
    assert_equal Time.new(2017, 10, 13, 15, 0, 0), time - interval
  end

  def test_corrects_negative_days
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(0, 0, 14, 0, 0, 0)
    assert_equal Time.new(2018, 7, 30, 15, 0, 0), time - interval
  end
end
