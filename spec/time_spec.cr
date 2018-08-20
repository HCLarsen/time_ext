require "./spec_helper"

describe Time do
  it "should add years" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(4, 0, 0)
    new_time = time + interval
    new_time.should eq(Time.new(2022, 8, 13, 15, 0, 0))
  end

  it "should subtract years" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(4, 0, 0)
    new_time = time - interval
    new_time.should eq(Time.new(2014, 8, 13, 15, 0, 0))
  end

  it "should add days" do
    time = Time.new(2018, 6, 30, 15, 0, 0)
    interval = Time::Interval.new(0, 0, 1)
    new_time = time + interval
    new_time.should eq(Time.new(2018, 7, 1, 15, 0, 0))
  end

  it "should add months" do
    time = Time.new(2018, 6, 30, 15, 0, 0)
    interval = Time::Interval.new(0, 1, 0)
    new_time = time + interval
    new_time.should eq(Time.new(2018, 7, 30, 15, 0, 0))
  end

  it "should correct for shorter months" do
    time = Time.new(2018, 10, 31, 15, 0, 0)
    interval = Time::Interval.new(0, 1, 0)
    new_time = time + interval
    new_time.should eq(Time.new(2018, 11, 30, 15, 0, 0))
  end

  it "should correct for negative months" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(0, 10, 0)
    new_time = time - interval
    new_time.should eq(Time.new(2017, 10, 13, 15, 0, 0))
  end

  it "should correct negative days" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    interval = Time::Interval.new(0, 0, 14)
    new_time = time - interval
    new_time.should eq(Time.new(2018, 7, 30, 15, 0, 0))
  end
end
