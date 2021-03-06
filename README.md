# time_ext

Extends the functionality of the core Time object by adding a date specific span object called DateSpan. Whereas Time::Span represents a passage of time specified by seconds, Time::DateSpan represents a passage of time represented by months, days and seconds. With this, a developer can represent a specific number of days, regardless of a Daylight Savings Time shift, or a number of a months, regardless of any leap days that may be in between.

This library also overrides some of the convenience methods to the Int object, to return DateSpan instead of Span objects for Int#days, Int#weeks, Int#months, and Int#years.

NOTE: This library is just a rough draft. This functionality is being added to the Crystal core library.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  time_ext:
    github: your-github-user/time_ext
```

## Usage

```crystal
require "time_ext"
```

Creating an DateSpan instance:

Time::DateSpan.new(5, 0, 0)  #=> 5 years
Time::DateSpan.new(0, 0, 3)  #=> 3 days

Integer convenience methods:

```crystal
72.hours  #=> 3.00:00:00 Time::Span
3.days    #=> 3.00:00:00 Time::DateSpan
```

Adding Spans and DateSpans to a Time instance:

```crystal
time = Time.new(2018, 11, 3, 9, 0, 0)
time + 72.hours #=> 2018-11-06 08:00:00.0 -05:00 Local
time + 3.days   #=> 2018-11-06 09:00:00.0 -05:00 Local
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/time_ext/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [HCLarsen](https://github.com/HCLarsen) Chris Larsen - creator, maintainer
