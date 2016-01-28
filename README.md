# Apportion

A Ruby implementation for apportionment

### Description
Apportionment is most often associated with the [US Congressional apportionment][congress_ep],
using the **Equal Proportions** (or Huntington-Hill) method.

Other domains might make use of apportionment. One example includes the division of a scarce
resource among recipients, according to a pre-determined set of recipient weights.
In this usage, the apportionment might occur at regular intervals, and each apportionment
might actually be more of a re-balancing operation.

Other apportionment methods exist, notably the [**Quota**][ams_balinski] method,
that address issues with **Equal Proportions**.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apportion'
```

And then execute

    $ bundle

Or install it yourself as

    $ gem install apportion

## Usage

### Apportion.division(weights, size)

Returns a hash with the size quantity distributed among recipients

`weights` (required) a hash of relative integer proportions for each recipient

`size` (required) an integer quantity to apportion

## Development

To install dependencies

    $ bundle

To run the tests

    $ rake

## License

The gem is available as open source under the terms of the [MIT License][license].

[congress_ep]: https://en.wikipedia.org/wiki/United_States_congressional_apportionment#The_method_of_equal_proportions
[ams_balinski]: https://www.maa.org/sites/default/files/pdf/upload_library/22/Ford/BalinskiYoung.pdf
[license]: http://opensource.org/licenses/MIT
