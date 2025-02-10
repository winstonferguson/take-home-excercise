require "test_helper"

class DiscountTest < ActiveSupport::TestCase
  test "should validate presence of name" do
    discount = Discount.new()

    assert_not discount.valid?, "Validated a product without name"
  end
end
