require 'test_helper'
require 'apportion/util'

describe 'Util' do
  include Apportion::Util
  describe '#file_read_json_to_hash' do
    let(:path_to_fixtures) { 'test/fixtures/balinski' }
    it 'balinski table_9' do
      hash = {a: 9061, b: 7179, c: 5259, d: 3319, e: 1182}
      assert_equal(hash, file_read_json_to_hash(path_to_fixtures, 'table_9_populations.json'))
    end
  end

  it '#hash_values_sum' do
    assert_equal 13, hash_values_sum({a: 8, b: 2, c: 3})
  end

  it '#symbolize_keys' do
    assert_equal({a: 0, b: '2', c: '3'}, symbolize_keys({'a' =>  0, 'b' => '2', c: '3'}))
  end
end
