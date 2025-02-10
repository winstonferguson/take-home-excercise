json.extract! product, :id, :supplier_id, :name, :status, :sku, :price, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
json.image url_for(product.image)
