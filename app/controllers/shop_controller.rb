# Controls the shop's main functionality, including displaying products and managing the shopping cart.
class ShopController < ApplicationController
  before_action :set_cart

  # Loads and displays all active products in the shop.
  def index
    @products = Product.active
  end

  private

  # Retrieves the cart associated with the user's session using a client token stored in cookies.
  def set_cart
    @cart = Order.find_by_token(cookies[:client_token])
  end
end
