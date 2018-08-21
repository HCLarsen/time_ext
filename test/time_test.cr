require "minitest/autorun"

require "/../src/time_ext.cr"

class TimeDateSpanTest < Minitest::Test
  def test_adds_years
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(4, 0, 0)
    assert_equal Time.new(2022, 8, 13, 15, 0, 0), time + date_span
  end

  def test_subtracts_years
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(4, 0, 0)
    assert_equal Time.new(2014, 8, 13, 15, 0, 0), time - date_span
  end

  def test_adds_days
    time = Time.new(2018, 6, 30, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 0, 1)
    assert_equal Time.new(2018, 7, 1, 15, 0, 0), time + date_span
  end

  def test_adds_months
    time = Time.new(2018, 6, 30, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 1, 0)
    assert_equal Time.new(2018, 7, 30, 15, 0, 0), time + date_span
  end

  def test_corrects_for_shorter_months
    time = Time.new(2018, 10, 31, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 1, 0)
    assert_equal Time.new(2018, 11, 30, 15, 0, 0), time + date_span
  end

  def test_corrects_negative_months
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 10, 0)
    assert_equal Time.new(2017, 10, 13, 15, 0, 0), time - date_span
  end

  def test_corrects_negative_days
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 0, 14)
    assert_equal Time.new(2018, 7, 30, 15, 0, 0), time - date_span
  end
end
