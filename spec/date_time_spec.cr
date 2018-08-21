require "./spec_helper"

describe Time::DateSpan do
  it "should initialize" do
    date_span = Time::DateSpan.new(3, 5, 18)
    date_span.years.should eq(3)
    date_span.months.should eq(5)
    date_span.days.should eq(18)
  end

  it "should generate from Int" do
    days = 20.days
    days.should eq(Time::DateSpan.new(0, 0, 20))

    weeks = 4.weeks
    weeks.should eq(Time::DateSpan.new(0, 0, 28))

    months = 6.months
    months.should eq(Time::DateSpan.new(0, 6, 0))

    years = 10.years
    years.should eq(Time::DateSpan.new(10, 0, 0))
  end
end
