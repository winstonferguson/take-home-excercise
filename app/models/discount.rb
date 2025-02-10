# frozen_string_literal: true

# Represents a discount that reduces the total price of an order.
class Discount < ApplicationRecord
  # Establishes a many-to-many relationship between discounts and orders via order adjustments.
  has_many :order_adjustments, dependent: :destroy
  has_many :orders, through: :order_adjustmentss

  # Ensures flat discounts have a positive value.
  validates :amount, numericality: { greater_than: 0.00 }

  # Ensures every discount has a name.
  validates :name, presence: true
end
