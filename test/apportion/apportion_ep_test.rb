require 'test_helper'
require 'apportion'

describe 'Apportion via equal proportions' do
  include Apportion
  describe '#division' do
    let(:weights) { {a: 41, b: 32, c: 27} }
    it 'one' do
      assert_equal({a: 1, b: 0, c: 0}, division(weights, 1))
    end
    it 'two' do
      assert_equal({a: 1, b: 1, c: 0}, division(weights, 2))
    end
    it 'three' do
      assert_equal({a: 1, b: 1, c: 1}, division(weights, 3))
    end
    it 'four' do
      assert_equal({a: 2, b: 1, c: 1}, division(weights, 4))
    end
    it 'ten' do
      assert_equal({a: 4, b: 3, c: 3}, division(weights, 10))
    end

    describe 'US census 2010' do
      let(:path_to_fixtures) { 'test/fixtures/census' }
      let(:populations) { Apportion::Util.file_read_json_to_hash(path_to_fixtures, 'populations_2010.json') }
      let(:apportionment) { Apportion::Util.file_read_json_to_hash(path_to_fixtures, 'apportionment_2010.json') }
      it 'four hundred, thirty five' do
        assert_equal(apportionment, division(populations, 435))
      end
    end

    describe 'w greatly unbalanced weights' do
      let(:big_weight) { Apportion::Algorithm::EqualProportions::BIG_FIXNUM }
      it 'three comparison' do
        assert_equal({a: 1, b: 1, c: 1}, division({a: big_weight, b: 1, c: 1}, 3))
        assert_equal({a: 2, b: 1, c: 0}, division({a: 2 * big_weight, b: 1, c: 1}, 3))
        assert_equal({a: 3, b: 0, c: 0}, division({a: 4 * big_weight , b: 1, c: 1}, 3))
      end
    end
  end
end
