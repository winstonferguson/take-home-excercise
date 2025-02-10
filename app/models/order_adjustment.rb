# frozen_string_literal: true

# Represents an adjustment on an order.
class OrderAdjustment < ApplicationRecord
  # Each order item is linked to a specific discunt and order.
  belongs_to :discount
  belongs_to :order
end
