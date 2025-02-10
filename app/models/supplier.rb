# frozen_string_literal: true

# Represents a supplier that provides products for sale in the application.
class Supplier < ApplicationRecord
  # A supplier can have multiple associated products.
  # If a supplier is deleted, all their products are also removed.
  has_many :products, dependent: :destroy

  # Ensures every supplier has a name.
  validates :name, presence: true
end
