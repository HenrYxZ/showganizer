json.array!(@photo_series) do |photo_series|
  json.extract! photo_series, :path, :show_id
  json.url photo_series_url(photo_series, format: :json)
end
