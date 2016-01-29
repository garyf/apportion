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

      describe 'w prior_portions' do
        let(:portions) { {a: 8, b: 3, c: 5} }
        it { assert_equal(portions, initial_portions(keys, prior_portions: portions)) }
      end
    end

    describe 'w options required_minimum and prior_portions' do
      it 'w a minimum > prior portion, returns the minimum' do
        assert_equal(
          {a: 5, b: 2, c: 2},
          initial_portions(keys, {
            required_minimum: 2,
            prior_portions: {a: 5, b: 0, c: 1}}
          ))
      end

      describe 'w a minimum < prior portion' do
        let(:portions) { {a: 8, b: 3, c: 5} }
        it 'returns the prior portion' do
          assert_equal(
            portions,
            initial_portions(keys, {
              required_minimum: 2,
              prior_portions: portions}
            ))
        end
      end
    end
  end
end
