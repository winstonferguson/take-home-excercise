Rails.application.routes.draw do
  resources :order_adjustments
  resources :discounts

  root "shop#index"

  get "shop", controller: "shop", action: :index

  # Cart controller actions
  get "cart", controller: "cart", action: :edit

  patch "cart/checkout", controller: "cart", action: :checkout
  patch "cart/reset", controller: "cart", action: :reset

  get "cart/summary",
    controller: "cart",
    action: :summary,
    default: { format: :json }

  post "cart/add_item/:product_id",
    controller: "cart",
    action: :add_item,
    as: :cart_add_item

  patch "cart/update_item/:order_item_id",
    controller: "cart",
    action: :update_item,
    as: :cart_update_item,
    default: { format: :json }

  patch "cart/update_adjusdment/:order_adjustment_id",
    controller: "cart",
    action: :update_adjustment,
    as: :cart_update_adjustment,
    default: { format: :json }

  post "cart/remove_item/:order_item_id",
    controller: "cart",
    action: :remove_item,
    as: :cart_remove_item

  resources :order_items
  resources :orders
  resources :products
  resources :suppliers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
