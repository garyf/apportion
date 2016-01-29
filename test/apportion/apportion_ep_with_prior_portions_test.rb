require 'test_helper'
require 'apportion'

describe 'Apportion via equal proportions w options[:prior_portions]' do
  include Apportion
  describe '#division' do
    let(:weights) { {a: 41, b: 32, c: 27} }
    it 'seven' do
      assert_equal({a: 3, b: 2, c: 2}, division(weights, 7, prior_portions: {a: 3, b: 2, c: 2}))
      assert_equal({a: 4, b: 2, c: 1}, division(weights, 7, prior_portions: {a: 4, b: 0, c: 0}))
      assert_equal({a: 5, b: 1, c: 1}, division(weights, 7, prior_portions: {a: 5, b: 0, c: 0}))
      assert_equal({a: 6, b: 1, c: 0}, division(weights, 7, prior_portions: {a: 6, b: 0, c: 0}))
      assert_equal({a: 7, b: 0, c: 0}, division(weights, 7, prior_portions: {a: 7, b: 0, c: 0}))
    end
    it 'ten' do
      assert_equal({a: 5, b: 2, c: 3}, division(weights, 10, prior_portions: {a: 5, b: 0, c: 3}))
    end
  end
end
