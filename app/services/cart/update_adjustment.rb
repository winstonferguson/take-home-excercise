# frozen_string_literal: true

# Service class for updating an adjustment in the shopping cart.
class Cart
  class UpdateAdjustment
    include Cart::Concerns::Checkable

    # Provides feedback on the operation.
    attr_reader :message

    def initialize(cart:, adjustment:, amount: 0.00)
      @cart = cart
      @adjustment = adjustment
      @amount = amount
      @message = "Cart:UpdateAdjustment "
    end

    # Attempts to update the adjustment in the cart.
    # Returns a boolean indicating success or failure.
    def success?
      update_adjustment_in_cart
    end

    private

    # Updates the adjustment amount in the cart.
    # Ensures the new amount does not exceed the discount limit.
    def update_adjustment_in_cart
      begin
        # Validate that the new amount does not exceed the discount amount.
        unless @amount <= @adjustment.discount.amount
          @message += 'failed checkable test.'
          return false
        end

        # Attempt to update the adjustment record.
        unless @adjustment.update(amount: @amount)
          @message += 'unable to update order adjustment.'
          return false
        end

        # Trigger an update on the order totals.
        @adjustment.order.updater!

        @message += "adjustment updated."

        true
      rescue StandardError => e
        Rails.logger.error e
        @message += e.to_s
        false
      end
    end
  end
end
