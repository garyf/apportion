module Apportion
  # Utility methods
  module Util
    module_function

    # Reads a JSON file and returns a hash with symbols as keys
    #
    # @param path_to_directory [String]
    # @param json_file_name [String]
    # @return [Hash] with symbolized keys
    # @example
    #   file_read_json_to_hash(path_to_directory, json_file_name)
    #   # => {a: 5, b: 2, c: 3}

    def file_read_json_to_hash(path_to_directory, json_file_name)
      hash = JSON.parse(File.read(File.join(path_to_directory, json_file_name)))
      symbolize_keys(hash)
    end

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

    # Returns a new hash with symbols as keys
    #
    # @param hash [Hash]
    # @return [Hash] a new hash with all string keys converted to symbols,
    #   provided that the keys respond to #to_sym
    # @see cf. rails activesupport/lib/active_support/core_ext/hash/keys.rb
    # @example
    #   symbolize_keys({'a' =>  0, 'b' => '2', c: '3'})
    #   # => {a: 0, b: '2', c: '3'}

    def symbolize_keys(hash)
      transform_keys(hash) { |key| key.to_sym rescue key }
    end

    def transform_keys(hash)
      result_hash = Hash.new
      hash.keys.each { |k| result_hash[yield(k)] = hash[k] }
      result_hash
    end

    private_class_method :transform_keys
  end
end
