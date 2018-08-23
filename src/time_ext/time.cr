struct Time
  def +(date_span : Time::DateSpan) : Time
    new_time = self.add_months(date_span.total_months)
    new_time.add_days(date_span.days)
  end

  def -(date_span : Time::DateSpan) : Time
    new_time = self.add_months(-date_span.total_months)
    new_time.add_days(-date_span.days)
  end

  def add_months(months : Int32) : Time
    year = self.year + months / 12
    month = self.month + months % 12
    day = self.day

    if month > 12
      month -= 12
      year += 1
    elsif month < 0
      year -= 1
      month += 12
    end
    if day > DAYS_MONTH[month]
      day = DAYS_MONTH[month]
    end

    Time.new(year, month, day, self.hour, self.minute, self.second)
  end

  def add_days(days : Int32) : Time
    day = self.day + days

    if day > DAYS_MONTH[month]
      day -= DAYS_MONTH[month]
      month = self.month + 1
    elsif day < 0
      month = self.month - 1
      day += DAYS_MONTH[month]
    else
      month = self.month
    end

    if month > 12
      month -= 12
      year = self.year + 1
    elsif month < 0
      year = self.year - 1
      month += 12
    else
      year = self.year
    end

    Time.new(year, month, day, self.hour, self.minute, self.second)
  end
end
