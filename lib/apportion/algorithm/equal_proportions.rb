module Apportion
  module Algorithm
    # Selects the next recipient
    module EqualProportions

      BIG_FIXNUM = 2 ** 30

      module_function

      # Selects the next recipient by sorting the equal proportions rank-index of the recipients
      #
      # see Balinski, M. and H. Young, The Quota Method of Apportionment, Amer. Math. Monthly 82 (1975) 701-730.
      #
      # @param weights [Hash] relative integer proportions
      # @param portions [Hash]
      # @return [Symbol] recipient having the highest equal proportions rank-index
      # @example
      #   next_recipient({a: 41, b: 32, c: 27}, {a: 4, b: 3, c: 2})
      #   # => :c

      def next_recipient(weights, portions)
        weights.max_by { |k, v| recipient_rank(v, portions[k]) }[0]
      end

      def recipient_rank(weight, portion)
        return zero_rank(weight) if portion == 0
        weight / Math.sqrt(portion * (portion + 1)).to_f
      end

      # protect from division by zero
      def zero_rank(weight)
        weight * BIG_FIXNUM
      end

      private_class_method :recipient_rank,
        :zero_rank
    end
  end
end
