require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "should validate presence of token" do
    order = Order.new()

    assert_not order.valid?, "Validated an order without a token"
  end

  test "should validate uniqueness of token" do
    order = orders(:one)

    assert_not order.dup.valid?, "Validated an order with an existing token"
  end
end
