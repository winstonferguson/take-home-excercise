require "test_helper"

class SupplierTest < ActiveSupport::TestCase
  test "should validate presence of name" do
    supplier = Supplier.new
    assert_not supplier.valid?, "Validated a supplier without name"
  end
end
