# Provides helper methods for rendering product details in the shop and cart.
module ShopHelper
  # Displays the product title along with its supplier name.
  def shop_title(product)
    content_tag :h3, class: "title" do
      "#{product.name}, #{product.supplier.name}"
    end
  end

  # Formats and displays the product price with currency.
  def shop_price(product)
    content_tag :strong, class: "price" do
      number_to_currency(product.price, precision: 0)
    end
  end

  # Generates an "Add to Cart" button for a product.
  # Uses a Stimulus controller to handle interactions.
  def shop_add_to_cart_button(product, cart)
    # Defines data attributes for Stimulus controller.
    data = {
      controller: "add-to-cart",
      "add-to-cart-url-value": cart_add_item_path(product.id)
    }

    content_tag(:div, data:) do
      if cart&.has_item?(product)
        button_tag "✔", class: "add-to-cart button", disabled: true
      else
        button_tag "Add to cart", class: "add-to-cart button"
      end
    end
  end
end
