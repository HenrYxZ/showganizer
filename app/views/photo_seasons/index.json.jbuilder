json.array!(@photo_seasons) do |photo_season|
  json.extract! photo_season, :path, :show_id
  json.url photo_season_url(photo_season, format: :json)
end
