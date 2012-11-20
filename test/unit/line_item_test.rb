require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should aggregate double products" do
  	cart = Cart.create
  	line_item = cart.add_product(products(:ruby).id)
  	line_item.save
  	assert_no_difference 'cart.line_items.size' do
  		line_item = cart.add_product(products(:ruby).id)
  		line_item.save
  		assert cart.line_items.find_by_product_id(products(:ruby).id).quantity == 2
  	end
  end

  test "should not aggregate uniquee products" do
  	cart = Cart.create
  	line_item = cart.add_product(products(:ruby).id)
  	line_item.save
  	assert_difference 'cart.line_items.size', 1 do
  		line_item = cart.add_product(products(:ruby2).id)
  		line_item.save
  		assert cart.line_items.find_by_product_id(products(:ruby).id).quantity == 1
  	end
  end

end
