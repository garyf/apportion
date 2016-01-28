require 'test_helper'
require 'apportion/algorithm/equal_proportions'

describe 'EqualProportions' do
  include Apportion::Algorithm::EqualProportions
  describe '#next_recipient' do
    let(:weights) { {a: 41, b: 32, c: 27} }
    it 'zero' do
      assert_equal(:a, next_recipient(weights, {a: 0, b: 0, c: 0}))
    end
    it 'one' do
      assert_equal(:b, next_recipient(weights, {a: 1, b: 0, c: 0}))
    end
    it 'two' do
      assert_equal(:c, next_recipient(weights, {a: 1, b: 1, c: 0}))
    end
    it 'three' do
      assert_equal(:a, next_recipient(weights, {a: 1, b: 1, c: 1}))
    end
    it 'nine' do
      assert_equal(:c, next_recipient(weights, {a: 4, b: 3, c: 2}))
    end
  end
end
