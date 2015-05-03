json.array!(@carts) do |cart|
  json.extract! cart, :id, :store_id
  json.url cart_url(cart, format: :json)
end
