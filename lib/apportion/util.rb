module Apportion
  # Utility methods
  module Util
    module_function

    # Sums all of the values in a hash
    #
    # @param hash [Hash] with numeric values
    # @return [Numeric] the sum of all values
    # @example
    #   hash_values_sum({a: 8, b: 2, c: 3})
    #   # => 13

    def hash_values_sum(hash)
      hash.values.reduce(0) { |acc, v| acc + v }
    end
  end
end
