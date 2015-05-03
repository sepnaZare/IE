json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :user_id, :date, :total_cost
  json.url purchase_url(purchase, format: :json)
end
