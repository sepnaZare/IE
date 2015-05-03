json.array!(@shoppings) do |shopping|
  json.extract! shopping, :id, :tag_id, :usage_id, :purchase_id
  json.url shopping_url(shopping, format: :json)
end
