json.array!(@tags) do |tag|
  json.extract! tag, :id, :item_id, :is_sold, :tag_serial
  json.url tag_url(tag, format: :json)
end
