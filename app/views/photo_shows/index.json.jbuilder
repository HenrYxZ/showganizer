json.array!(@photo_shows) do |photo_show|
  json.extract! photo_show, :path, :show_id
  json.url photo_show_url(photo_show, format: :json)
end
