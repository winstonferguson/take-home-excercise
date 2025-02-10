require "application_system_test_case"

class OrderAdjustmentsTest < ApplicationSystemTestCase
  setup do
    @order_adjustment = order_adjustments(:one)
  end

  test "visiting the index" do
    visit order_adjustments_url
    assert_selector "h1", text: "Order adjustments"
  end

  test "should create order adjustment" do
    visit order_adjustments_url
    click_on "New order adjustment"

    fill_in "Amount", with: @order_adjustment.amount
    fill_in "Discount", with: @order_adjustment.discount_id
    fill_in "Order", with: @order_adjustment.order_id
    click_on "Create Order adjustment"

    assert_text "Order adjustment was successfully created"
    click_on "Back"
  end

  test "should update Order adjustment" do
    visit order_adjustment_url(@order_adjustment)
    click_on "Edit this order adjustment", match: :first

    fill_in "Amount", with: @order_adjustment.amount
    fill_in "Discount", with: @order_adjustment.discount_id
    fill_in "Order", with: @order_adjustment.order_id
    click_on "Update Order adjustment"

    assert_text "Order adjustment was successfully updated"
    click_on "Back"
  end

  test "should destroy Order adjustment" do
    visit order_adjustment_url(@order_adjustment)
    click_on "Destroy this order adjustment", match: :first

    assert_text "Order adjustment was successfully destroyed"
  end
end
