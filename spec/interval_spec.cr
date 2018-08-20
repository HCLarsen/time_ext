require "./spec_helper"

describe Time::Interval do
  it "should initialize" do
    interval = Time::Interval.new(3, 5, 18)
    interval.years.should eq(3)
    interval.months.should eq(5)
    interval.days.should eq(18)
  end

  it "should generate from Int" do
    days = 20.days
    days.should eq(Time::Interval.new(0, 0, 20))

    weeks = 4.weeks
    weeks.should eq(Time::Interval.new(0, 0, 28))

    months = 6.months
    months.should eq(Time::Interval.new(0, 6, 0))

    years = 10.years
    years.should eq(Time::Interval.new(10, 0, 0))
  end
end
