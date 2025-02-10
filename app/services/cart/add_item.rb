# frozen_string_literal: true

# Handles adding products to a shopping cart.
# Returns a boolean indicating success or failure.
# Stores a message detailing the outcome.
class Cart
  class AddItem
    include Cart::Concerns::Checkable

    # Provides feedback on the operation.
    attr_reader :message

    def initialize(cart:, product:, quantity: 1)
      @cart = cart
      @product = product
      @quantity = quantity
      @message = "Cart:AddItem "
    end

    # Attempts to add the product to the cart.
    def success?
      add_product_to_cart
    end

    private

    # Adds the product to the cart if all validations pass.
    def add_product_to_cart
      begin
        price = @product.price

        unless checkable_product?(@product) && checkable_price?(price) && checkable_quantity?(@quantity)
          @message += 'failed checkable test.'
          return false
        end

        subtotal = price * @quantity
        @cart.order_items.create!(product: @product, price:, subtotal:, quantity: @quantity)

        # Update the order totals
        @cart.updater!

        @message += "product added to cart."

        true
      rescue StandardError => e
        Rails.logger.error e
        @message += e.to_s
        false
      end
    end
  end
end
