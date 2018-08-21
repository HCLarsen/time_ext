struct Time
  def +(date_span : Time::DateSpan)
    year = self.year + date_span.years
    month = self.month + date_span.months
    day = self.day + date_span.days

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
    Time.new(year, month, day, self.hour, self.minute, self.second)
  end

  def -(date_span : Time::DateSpan)
    year = self.year - date_span.years
    month = self.month - date_span.months
    day = self.day - date_span.days

    if month < 0
      year -= 1
      month += 12
    end
    if day < 0
      month -= 1
      day += DAYS_MONTH[month]
    end

    Time.new(year, month, day, self.hour, self.minute, self.second)
  end
end
