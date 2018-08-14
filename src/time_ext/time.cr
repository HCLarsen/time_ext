struct Time
  def +(interval : Time::Interval)
    year = self.year + interval.years
    month = self.month + interval.months
    day = self.day + interval.days
    hour = self.hour + interval.hours
    minute = self.minute + interval.minutes
    second = self.second + interval.seconds

    if month > 12
      month -= 12
      year += 1
    end
    if day > DAYS_MONTH[self.month]
      day -= DAYS_MONTH[month]
      month += 1
    elsif day > DAYS_MONTH[month]
      day = DAYS_MONTH[month]
    end
    if hour > 24
      hour -= 24
      day += 1
    end
    if minute > 60
      minute -= 60
      hour += 1
    end
    if second > 60
      second -= 60
      minute += 1
    end
    Time.new(year, month, day, hour, minute, second)
  end

  def -(interval : Time::Interval)
    year = self.year - interval.years
    month = self.month - interval.months
    day = self.day - interval.days
    hour = self.hour - interval.hours
    minute = self.minute - interval.minutes
    second = self.second - interval.seconds

    if month < 0
      year -= 1
      month += 12
    end
    if day < 0
      month -= 1
      day += DAYS_MONTH[month]
    end
    if hour < 0
      day -= 1
      hour += 24
    end
    if minute < 0
      hour -= 1
      minute += 60
    end
    if second < 0
      minute -= 1
      second += 60
    end

    Time.new(year, month, day, hour, minute, second)
  end
end
