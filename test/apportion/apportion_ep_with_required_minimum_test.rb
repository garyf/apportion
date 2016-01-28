require 'test_helper'
require 'apportion'

describe 'Apportion via equal proportions w options[:required_minimum]' do
  include Apportion
  describe '#division' do
    let(:weights) { {a: 61, b: 21, c: 18} }
    it 'two' do
      e = assert_raises(RuntimeError) { division(weights, 2, required_minimum: 1) }
      assert_match /Size less than minimum sum_portions/, e.message
    end
    it 'three' do
      assert_equal({a: 1, b: 1, c: 1}, division(weights, 3, required_minimum: 1))
    end
    it 'eight' do
      assert_equal({a: 4, b: 2, c: 2}, division(weights, 8, required_minimum: 2))
    end

    describe 'w greatly unbalanced weights' do
      let(:big_weight) { Apportion::Algorithm::EqualProportions::BIG_FIXNUM }
      let(:minimums) { {a: 1, b: 1, c: 1} }
      it 'three comparison' do
        assert_equal(minimums, division({a: big_weight, b: 1, c: 1}, 3, required_minimum: 1))
        assert_equal(minimums, division({a: 2 * big_weight, b: 1, c: 1}, 3, required_minimum: 1))
        assert_equal(minimums, division({a: 4 * big_weight , b: 1, c: 1}, 3, required_minimum: 1))
      end
    end
  end
end
