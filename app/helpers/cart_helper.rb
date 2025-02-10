# Provides helper methods for rendering cart-related information and actions in views.
module CartHelper
  # Displays the discount amount for a cart adjustment.
  def cart_discount(adjustment)
    content_tag :div, class: "discount", data: { "cart-adjustment-target": "amount" } do
      number_to_currency(adjustment.amount, precision: 0)
    end
  end

  # Displays the total number of items in the cart.
  def cart_item_count(cart)
    content_tag :div, class: "count", data: { "cart-target": "itemCount" } do
      "#{cart.item_count} items"
    end
  end

  # Displays the subtotal for an individual cart item.
  def cart_item_subtotal(item)
    content_tag :div, class: "subtotal", data: { "cart-item-target": "subtotal" } do
      number_to_currency(item.subtotal, precision: 0)
    end
  end

  def cart_pay_now(cart)
    button_to "Place order", cart_checkout_path, class: "button pay", method: :patch
  end

  # Renders a button to remove an item from the cart.
  def cart_remove_item(product)
    button_to image_tag("icon_destroy.svg", width: "20px"), cart_remove_item_path(product),
              class: "destroy", method: :post
  end

  # Renders a reset button to clear the cart if there are items in it.
  def cart_reset_link(cart)
    return unless cart.order_items.any?

    button_to "Reset", cart_reset_path, class: "reset", method: :patch
  end

  # Displays the cart subtotal.
  def cart_subtotal(cart)
    content_tag :div, class: "subtotal", data: { "cart-target": "subtotal" } do
      number_to_currency(cart.subtotal, precision: 0)
    end
  end

  # Displays the cart total.
  def cart_total(cart)
    content_tag :div, class: "total", data: { "cart-target": "total" } do
      number_to_currency(cart.total, precision: 0)
    end
  end
end
