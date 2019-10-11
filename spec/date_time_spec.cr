require "./spec_helper"

describe Time::DateSpan do
  it "should initialize" do
    date_span = Time::DateSpan.new(3, 5, 18)
    date_span.years.should eq(3)
    date_span.months.should eq(5)
    date_span.days.should eq(18)
  end

  it "should generate from Int" do
    20.days.should eq(Time::DateSpan.new(0, 0, 20))
    4.weeks.should eq(Time::DateSpan.new(0, 0, 28))
    6.months.should eq(Time::DateSpan.new(0, 6, 0))
    10.years.should eq(Time::DateSpan.new(10, 0, 0))
  end
end
