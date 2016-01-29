require 'apportion/util'

module Apportion
  # Configure per options
  module Setup
    module_function

    # Determines initial portions for recipients according to optional constraints
    #
    # @param keys [Hash] correspond to recipients
    # @param options [Hash]
    # @param options [Hash] :prior_portions from a previous apportionment
    # @option options [Integer] :required_minimum smallest portion for each recipient
    # @return [Hash] portions
    # @example
    #   initial_portions({a: 41, b: 32, c: 27}, required_minimum: 2)
    #   # => {a: 2, b: 2, c: 2}

    def initial_portions(keys, options)
      portions = Hash.new
      int = options[:required_minimum] || 0
      keys.each { |k| portions[k] = int }
      hash = options[:prior_portions]
      return portions unless hash
      prior_portions_included(portions, hash)
    end

    def prior_portions_included(portions, prior_portions)
      portions.merge(prior_portions) { |_k, o, n| [o, n].max }
    end

    # @raise [RuntimeError] if size too small
    def validate(size, sum_portions)
      fail('Size less than minimum sum_portions') if size < sum_portions
    end

    private_class_method :prior_portions_included
  end
end
