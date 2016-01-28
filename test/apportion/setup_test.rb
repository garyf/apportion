require 'test_helper'
require 'apportion/setup'

describe 'Setup' do
  include Apportion::Setup
  describe '#initial_portions' do
    let(:keys) { [:a, :b, :c] }
    it 'w/o options' do
      assert_equal({a: 0, b: 0, c: 0}, initial_portions(keys, {}))
    end

    describe 'w options' do
      it 'w required_minimum' do
        assert_equal({a: 2, b: 2, c: 2}, initial_portions(keys, {required_minimum: 2}))
      end
    end
  end
end
