# Apportion [![travis][ci_img]][travis] [![yard docs][yd_img]][yard_docs] [![code climate][cc_img]][code_climate]

A Ruby implementation for apportionment

### Description
Apportionment is most often associated with the [US Congressional apportionment][congress_ep],
using the **Equal Proportions** (or Huntington-Hill) method.

In general, apportionment involves the division of a scarce resource among recipients, according
to a pre-determined set of recipient weights. Further, a series of apportionments might occur over
time, with each new apportionment overlaying the previous.

Different domains might make use of apportionment. One example is the allocation (or distribution)
of sellable inventory among a number of retail stores, according to the expected sales rate for
each store. For this usage, recipients would likely begin an apportionment with varying quantities
of existing inventory.

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

### Apportion.division(weights, size, options = {})

Returns a hash (a key for each recipient) with the size quantity distributed among recipients
(as values)

#### Parameters

`weights` (required) a [Hash] of relative integer proportions for each recipient

`size` (required) an [Integer] quantity to apportion

`options` (optional) [Hash] keys

* **:prior_portions** a [Hash] prior portions for each recipient from a previous apportionment
* **:required_minimum** an [Integer] smallest portion for each recipient

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

[travis]: https://travis-ci.org/garyf/apportion
[ci_img]: https://travis-ci.org/garyf/apportion.svg?branch=master
[yard_docs]: http://www.rubydoc.info/github/garyf/apportion
[yd_img]: http://img.shields.io/badge/yard-docs-blue.svg
[code_climate]: https://codeclimate.com/github/garyf/apportion
[cc_img]: https://codeclimate.com/github/garyf/apportion/badges/gpa.svg
