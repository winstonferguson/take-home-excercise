require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should validate presence of name" do
    product = Product.new(supplier: suppliers(:one))

    assert_not product.valid?, "Validated a product without name"
  end

  test "should validate presence of supplier" do
    product = Product.new(name: "Speaker")

    assert_not product.valid?, "Validated a product without a supplier"
  end

  test "don't activate zero priced products" do
    product = products(:one)

    product.status = :active
    product.price = 0

    assert_not product.valid?, "Activated product without price"
  end
end
