require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  test "should validate price greater than zero" do
    order_item = order_items(:one)
    order_item.price = 0.00

    assert_not order_item.valid?, "Validated an order item with a price less than 0.01"
  end

  test "should validate total greater than zero" do
    order_item = order_items(:one)
    order_item.subtotal = 0.00

    assert_not order_item.valid?, "Validated an order item with a subtotal less than 0.01"
  end
end
