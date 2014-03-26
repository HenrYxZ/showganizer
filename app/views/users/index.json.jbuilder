json.array!(@users) do |user|
  json.extract! user, :name, :email, :password, :image, :type_of_user
  json.url user_url(user, format: :json)
end
