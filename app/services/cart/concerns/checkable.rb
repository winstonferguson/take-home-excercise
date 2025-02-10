# frozen_string_literal: true

class Cart
  module Concerns
    module Checkable
      extend ActiveSupport::Concern

      def checkable_amount?(amount)
        unless amount < 0.00
          Rails.logger.error "Cart:Concerns:Checkable: Amount must be less than 0.00."
          return false
        end

        true
      end

      def checkable_price?(price)
        unless price > 0.00
          Rails.logger.error "Cart:Concerns:Checkable: Price must be greater than 0.00."
          return false
        end

        true
      end

      def checkable_product?(product)
        unless product.active?
          Rails.logger.error "Cart:Concerns:Checkable: Product must be active to add to order."
          return false
        end

        true
      end

      def checkable_quantity?(quantity)
        unless quantity.is_a? Integer
          Rails.logger.error "Cart:Concerns:Checkable: Quantity must be an integer."
          return false
        end

        true
      end
    end
  end
end
