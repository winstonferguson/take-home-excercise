# frozen_string_literal: true

# Represents a purchase, tracking order status and contents.
class Order < ApplicationRecord
  # Defines order statuses with validation.
  enum :status, { cart: 0, checkout: 1 }, validate: true

  # An order can have multiple adjustments (e.g., discounts).
  has_many :order_adjustments, dependent: :destroy
  has_many :discount, through: :order_adjustments

  # An order contains multiple items representing purchased products.
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  # Ensures every order has a unique token.
  validates :token,
            presence: true,
            uniqueness: true
  # Ensures order has subtotal.
  validates :subtotal,
            presence: true
  # Ensures every order has a total.
  validates :total,
            presence: true


  def has_item?(product)
    product_ids = order_items.pluck(:product_id)

    product_ids.include? product.id
  end

  def item_count
    order_items.sum(&:quantity)
  end

  # updates order totals based on items and adjustments
  def updater!
    self.subtotal = order_items.sum(&:subtotal).to_f
    self.adjustments_total = order_adjustments.sum(&:amount).to_f
    self.total = subtotal - adjustments_total

    save!
  end
end
