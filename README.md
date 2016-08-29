# StinkyCheese

Age calculator and formatter (with leap-year support..duh)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stinky_cheese'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stinky_cheese

## Usage

### age_from_dob

Calculate the age given a date of birth:

```ruby
dob = Date.parse('1993-12-09')
StinkyCheese.age_from_dob(dob)
```

StinkyCheese.age_from_dob can handle inputs that are either String, Date, DateTime, and Time Objects as well!
```ruby
dob = '1993-12-09'
StinkyCheese.age_from_dob(dob)
```

The date of death parameter can also be set to calculate the age a person died at:

```ruby
dob = '1931-01-09'
dod = '1971-12-10'
StinkyCheese.age_from_dob(dob, dod)
```
This will yield 40

### stage_of_life

StinkyCheese also gives a vague age teaser given an age. For example:

```ruby
StinkyCheese.stage_of_life(42)
```

This will yields "Early 40's"

```ruby
StinkyCheese.stage_of_life(2)
```

Will yield "Child"

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Spokeo/stinky_cheese.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

