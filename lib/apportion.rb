require 'apportion/algorithm/equal_proportions'

module Apportion
  module_function

  # Distributes a quantity among recipients by dividing proportionally according to relative
  # weights using the 'equal proportions' algorithm
  #
  # @param weights [Hash] relative integer proportions
  # @param size [Integer] quantity to apportion
  # @return [Hash] portions
  # @example
  #   division({a: 41, b: 32, c: 27}, 7)
  #   # => {a: 3, b: 2, c: 2}

  def division(weights, size)
    portions = initial_portions(weights.keys)
    next_portions(weights, portions, 0, size)
  end

  def initial_portions(keys)
    portions = Hash.new
    keys.each { |k| portions[k] = 0 }
    portions
  end

  # recursively
  def next_portions(weights, portions, sum_portions, size)
    return portions if sum_portions == size
    key = Algorithm::EqualProportions.next_recipient(weights, portions)
    now_portions = portions.merge(key => portions[key] + 1)
    next_portions(weights, now_portions, sum_portions + 1, size)
  end

  private_class_method :initial_portions,
    :next_portions
end
