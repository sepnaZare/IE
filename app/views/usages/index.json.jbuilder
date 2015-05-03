json.array!(@usages) do |usage|
  json.extract! usage, :id, :user_id, :cart_id
  json.url usage_url(usage, format: :json)
end
