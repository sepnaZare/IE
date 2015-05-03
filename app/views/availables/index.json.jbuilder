json.array!(@availables) do |available|
  json.extract! available, :id, :item_id, :store_id
  json.url available_url(available, format: :json)
end
