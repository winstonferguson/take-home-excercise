# frozen_string_literal: true

class Cart
  class UpdateItem
    include Cart::Concerns::Checkable

    # Provides feedback on the operation.
    attr_reader :message

    def initialize(cart:, item:, quantity: 1)
      @cart = cart
      @item = item
      @quantity = quantity
      @message = "Cart:UpdateItem "
    end

    # Attempts to update the product to the cart.
    def success?
      update_item_in_cart
    end

    private

    def update_item_in_cart
      begin
        unless checkable_quantity?(@quantity)
          @message += "failed checkable test."
          return false
        end

        subtotal = @item.price * @quantity

        unless @item.update(quantity: @quantity, subtotal:)
          @message += "unable to update order item."
          false
        end

        # Update the order totals
        @item.order.updater!

        @message += "item updated."

        true
      rescue StandardError => e
        Rails.logger.error e
        @message += e.to_s
        false
      end
    end
  end
end
