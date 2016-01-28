require 'test_helper'
require 'apportion/util'

describe 'Util' do
  include Apportion::Util
  it '#hash_values_sum' do
    assert_equal 13, hash_values_sum({a: 8, b: 2, c: 3})
  end
end
