json.extract! order_adjustment, :id, :order_id, :discount_id, :amount, :created_at, :updated_at
json.url order_adjustment_url(order_adjustment, format: :json)
