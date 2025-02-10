# Take-Home Exercise

This mini-application showcases shopping cart functionality. I'm building it with Rails 8.0.1, which I’m eager to explore for the first time. I use rbenv locally and will be working with Ruby 3.3.3, the latest available version available to me.

I had a particularly busy week and couldn’t prepare questions in advance, so I’ll kick-off this repository with the assumptions I’ve made.

## Assumptions

* My mini-application should be simple. I shouldn't focus on scalabity but instead, a robust process for a basic shopping cart functionalty.
* This means I won’t consider features like authentication, addresses, classifications, options, currencies, taxes, SEO fields...
* In the Figma design, each product title appears to include a supplier name (after the first comma). I will assume each product has one supplier.
* The reference design doesn’t indicate product variants. I will not implement variants and a product-variant relationship despite it being a flexible and widely used pattern for e-commerce.
* Since database implementation isn’t specified, I will use SQLite.
* No external gems are mentioned. The only additonal gem I'll use is the requestjs-rails gem to make Ajax Requests.
* A cart page normally follows a shop page, so my application’s root will be a product listing page. This page will feature products with an 'add to cart' functionality for each product.


## Code Overview

### Models

* Discount: Represents price offsets applicable to an order.
* Product: Represents items available for purchase.
* Order: Tracks user orders and their statuses.
* OrderAdjustment: Records products included in an order.
* OrderItem: Records discounts included in an order.
* Supplier: Source of products.


### Controllers

Scaffold controllers plus:

* ShopController: Manages product listings.
* CartController: Handles cart operations like adding or removing items and applying discounts.

### Helpers

* ShopHelper: Provides methods to present product information in the shop and cart.
* CartHelper: Offers helper methods for cart-related views.

### Stimulus Controllers

* AddToCartController: Manages adding products to the cart via AJAX.
* CartAdjustment Controller: Handles updates to cart adjustments.
* CartItemController: Handles updates to cart items, such as changing quantities.
* CartController: Updates cart summaries and totals dynamically.

### Services

* Cart: Retrieves or creates a cart
* Cart::AddItem: Handles adding products to a shopping cart.
* Cart::UpdateAdjustment: Updates an adjustment in the shopping cart.
* Cart::UpdateItem: Updates an item in the shopping cart.


