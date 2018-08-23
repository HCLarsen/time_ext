require "./spec_helper"

describe Time do
  it "should add years" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(4, 0, 0)
    new_time = time + date_span
    new_time.should eq(Time.new(2022, 8, 13, 15, 0, 0))
  end

  it "should subtract years" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(4, 0, 0)
    new_time = time - date_span
    new_time.should eq(Time.new(2014, 8, 13, 15, 0, 0))
  end

  it "should add days" do
    time = Time.new(2018, 6, 30, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 0, 1)
    new_time = time + date_span
    new_time.should eq(Time.new(2018, 7, 1, 15, 0, 0))
  end

  it "should add months" do
    time = Time.new(2018, 6, 30, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 1, 0)
    new_time = time + date_span
    new_time.should eq(Time.new(2018, 7, 30, 15, 0, 0))
  end

  it "should add multiple years worth of months" do
    time = Time.new(2018, 10, 31, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 36, 0)
    new_time = time + date_span
    new_time.should eq(Time.new(2021, 10, 31, 15, 0, 0))
  end

  it "should subtract multiple years worth of months" do
    time = Time.new(2018, 10, 31, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 36, 0)
    new_time = time - date_span
    new_time.should eq(Time.new(2015, 10, 31, 15, 0, 0))
  end

  it "should correct for shorter months" do
    time = Time.new(2018, 10, 31, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 1, 0)
    new_time = time + date_span
    new_time.should eq(Time.new(2018, 11, 30, 15, 0, 0))
  end

  it "should correct for month overflow" do
    time = Time.new(2018, 6, 30, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 10, 0)
    new_time = time + date_span
    new_time.should eq(Time.new(2019, 4, 30, 15, 0, 0))
  end

  it "should correct for month overflow when adding days" do
    time = Time.new(2018, 12, 30, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 0, 10)
    new_time = time + date_span
    new_time.should eq(Time.new(2019, 1, 9, 15, 0, 0))
  end

  it "should correct for negative months" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 10, 0)
    new_time = time - date_span
    new_time.should eq(Time.new(2017, 10, 13, 15, 0, 0))
  end

  it "should correct negative days" do
    time = Time.new(2018, 8, 13, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 0, 14)
    new_time = time - date_span
    new_time.should eq(Time.new(2018, 7, 30, 15, 0, 0))
  end

  it "should add months then days" do
    time = Time.new(2018, 10, 31, 15, 0, 0)
    date_span = Time::DateSpan.new(0, 1, 5)
    new_time = time + date_span
    new_time.should eq(Time.new(2018, 12, 5, 15, 0, 0))
  end

end
