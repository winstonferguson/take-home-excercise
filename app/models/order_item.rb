# frozen_string_literal: true

# Represents a product purchased within an order.
class OrderItem < ApplicationRecord
  # Each order item is linked to a specific product and order.
  belongs_to :product
  belongs_to :order

   # Ensure price is greater than zero
   # Free items and discounts should be handled via adjustments.
  validates :price, numericality: { greater_than: 0.00 }

  # Ensure subtotal is greater than zero to maintain valid order calculations.
  validates :subtotal, numericality: { greater_than: 0.00 }
end
