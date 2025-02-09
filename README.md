# Take-Home Exercise

This mini-application showcases shopping cart functionality. I'm building it with Rails 8.0.1, which I’m eager to explore for the first time. I use rbenv locally and will be working with Ruby 3.3.3, the latest available version available to me.

I had a particularly busy week and couldn’t prepare questions in advance, so I’ll kick-off this repository with the assumptions I’ve made.

## Assumptions

* My mini-application should be simple. I shouldn't focus on scalabity but instead, a robust process for a basic shopping cart functionalty.
* This means I won’t consider features like authentication, addresses, classifications, options, currencies, taxes, SEO fields...
* In the Figma design, each product title appears to include a supplier name (after the first comma). I will assume each product has one supplier.
* The reference design doesn’t indicate product variants. I will not implement variants and a product-variant relationship despite it being a flexible and widely used pattern for e-commerce.
* Since database implementation isn’t specified, I will use SQLite.
* No external gems are mentioned, and I don’t see a need for any (I’ll keep it simple with pure CSS).
* A cart page normally follows a shop page, so my application’s root will be a product listing page. This page will feature products with an 'add to cart' functionality for each product.

