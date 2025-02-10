# frozen_string_literal: true

# The Product model represents items available for sale in the application.
# Products are associated with Suppliers and can be purchased through Orders as OrderItems.
class Product < ApplicationRecord
  # Defines product status with enum values.
  # Ensures only valid statuses can be assigned.
  enum :status, { draft: 0, active: 1, archived: 0 }, validate: true

  # Associates the product with a supplier (required)
  belongs_to :supplier

  # A product can have a single attached image
  has_one_attached :image

  # Establishes a many-to-many relationship between products and orders via order items.
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  # Ensures every product has a name.
  validates :name, presence: true

  # Prevents activation of a product without a price greater than 0.00.
  validates :price,
            numericality: {
              greater_than: 0.00,
              message: " must be greater than %{value} to activate product."
            },
            if: -> { active? }
end
