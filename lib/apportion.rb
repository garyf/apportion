require 'apportion/algorithm/equal_proportions'
require 'apportion/setup'
require 'apportion/util'

# Top level interface, or API, to distribute a quantity among recipients
module Apportion
  module_function

  # Distributes a quantity among recipients by dividing proportionally according to relative
  # weights using the 'equal proportions' algorithm
  #
  # @param weights [Hash] relative integer proportions
  # @param size [Integer] quantity to apportion
  # @param options [Hash]
  # @option options [Hash] :prior_portions from a previous apportionment
  # @option options [Integer] :required_minimum smallest portion for each recipient
  # @return [Hash] portions
  # @example
  #   division({a: 41, b: 32, c: 27}, 7)
  #   # => {a: 3, b: 2, c: 2}

  def division(weights, size, options = {})
    portions = Setup.initial_portions(weights.keys, options)
    sum_portions = Util.hash_values_sum(portions)
    Setup.validate(size, sum_portions)
    next_step(weights, portions, sum_portions, size)
  end

  # recursively
  def next_step(weights, portions, sum_portions, size)
    return portions if sum_portions == size
    key = Algorithm::EqualProportions.next_recipient(weights, portions)
    next_portions = portions.merge(key => portions[key] + 1)
    next_step(weights, next_portions, sum_portions + 1, size)
  end

  private_class_method :next_step
end
