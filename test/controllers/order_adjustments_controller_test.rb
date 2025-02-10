require "test_helper"

class OrderAdjustmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_adjustment = order_adjustments(:one)
  end

  test "should get index" do
    get order_adjustments_url
    assert_response :success
  end

  test "should get new" do
    get new_order_adjustment_url
    assert_response :success
  end

  test "should create order_adjustment" do
    assert_difference("OrderAdjustment.count") do
      post order_adjustments_url, params: { order_adjustment: { amount: @order_adjustment.amount, discount_id: @order_adjustment.discount_id, order_id: @order_adjustment.order_id } }
    end

    assert_redirected_to order_adjustment_url(OrderAdjustment.last)
  end

  test "should show order_adjustment" do
    get order_adjustment_url(@order_adjustment)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_adjustment_url(@order_adjustment)
    assert_response :success
  end

  test "should update order_adjustment" do
    patch order_adjustment_url(@order_adjustment), params: { order_adjustment: { amount: @order_adjustment.amount, discount_id: @order_adjustment.discount_id, order_id: @order_adjustment.order_id } }
    assert_redirected_to order_adjustment_url(@order_adjustment)
  end

  test "should destroy order_adjustment" do
    assert_difference("OrderAdjustment.count", -1) do
      delete order_adjustment_url(@order_adjustment)
    end

    assert_redirected_to order_adjustments_url
  end
end
