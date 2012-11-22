require 'test_helper'

class PaymentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "presence of needed payment types" do
  	types = PaymentType.names
  	assert types.include?('Check')
  	assert types.include?('Credit Card')
  	assert types.include?('Purchase Order')
  end
end
