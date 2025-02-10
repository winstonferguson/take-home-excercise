# frozen_string_literal: true
class Cart
  attr_reader :order, :token

  # Service class for retrieving or creating a cart
  def initialize(client_token: nil)
    @token = client_token || token_generator
    @order = Order.cart.find_or_create_by(token:)
  end

  # Generates a random token to use for a users orders
  def token_generator
    "#{SecureRandom.urlsafe_base64(8)}#{(Time.now.to_f * 1000).to_i}"
  end
end
