# Handles shopping cart functionality, including adding, updating, and removing items.
class CartController < ApplicationController
  before_action :set_cart
  before_action :set_product, only: %w[add_item]
  before_action :set_order_adjustment, only: %w[update_adjustment]
  before_action :set_order_item, only: %w[update_item remove_item]

  # Adds an item to the cart.
  # Returns JSON response with success or failure message.
  def add_item
    item = Cart::AddItem.new(cart: @cart, product: @product)

    if item.success?
      render json: { message: item.message }, status: :ok
    else
      render json: { message: item.message }, status: :bad_request
    end
  end

  # Resets the cart by removing all items.
  def checkout
    @cart.order_items.destroy_all
    redirect_to shop_url, notice: "Place order successfully."
  end


  # Loads the cart edit page, initializing a discount if not present.
  def edit
    discount = Discount.find_by(name: "Slider")
    @order_adjustment = @cart.order_adjustments.find_or_create_by(discount:)
  end

  # Removes an item from the cart.
  # Redirects to the cart page with a success message.
  def remove_item
    @order_item.destroy!
    @cart.updater!

    respond_to do |format|
      format.html { redirect_to cart_path, status: :see_other, notice: "Order item was successfully removed." }
    end
  end

  # Updates a discount adjustment in the cart.
  # Returns updated adjustment amount or error message as JSON.
  def update_adjustment
    amount = params.require(:amount).to_d

    adjustment = Cart::UpdateAdjustment.new(cart: @cart, adjustment: @order_adjustment, amount:)

    if adjustment.success?
      @order_adjustment.reload
      amount = view_context.number_to_currency(@order_adjustment.amount, precision: 0)

      render json: { amount: }, status: :ok
    else
      render json: { message: adjustment.message }, status: :bad_request
    end
  end

  # Updates the quantity of an item in the cart.
  # Returns updated subtotal or error message as JSON.
  def update_item
    quantity = params.require(:quantity).to_i
    item = Cart::UpdateItem.new(cart: @cart, item: @order_item, quantity:)

    if item.success?
      @order_item.reload
      @cart.reload

      subtotal = view_context.number_to_currency(@order_item.subtotal, precision: 0)

      render json: { subtotal: }, status: :ok
    else
      render json: { message: item.message }, status: :bad_request
    end
  end

  # Retrieves and returns cart summary details (subtotal, total, item count) as JSON.
  def summary
    subtotal = view_context.number_to_currency(@cart.subtotal, precision: 0)
    total = view_context.number_to_currency(@cart.total, precision: 0)
    item_count = @cart.item_count

    render json: { item_count:, subtotal:, total: }, status: :ok
  end

  # Resets the cart by removing all items.
  # Redirects to the cart page.
  def reset
    @cart.order_items.destroy_all
    redirect_to cart_url
  end

  private

  # Initializes the cart using a client token stored in cookies.
  def set_cart
    @cart = Cart.new(client_token: cookies[:client_token]).order

    unless cookies[:client_token] == @cart.token
      cookies[:client_token] = @cart.token
    end
  end

  # Finds and sets the order adjustment from the request parameters.
  def set_order_adjustment
    @order_adjustment = OrderAdjustment.find(params.require(:order_adjustment_id))
  end

  # Finds and sets the order item from the request parameters.
  def set_order_item
    @order_item = OrderItem.find(params.require(:order_item_id))
  end

  # Finds and sets the product from the request parameters.
  def set_product
    @product = Product.find(params.require(:product_id))
  end
end
