json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :first_name, :last_name, :ssn, :email, :mobile, :phone_number
  json.url profile_url(profile, format: :json)
end
