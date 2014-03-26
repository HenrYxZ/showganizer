json.array!(@seasons) do |season|
  json.extract! season, :name, :start_date, :end_date, :description, :number, :series_id
  json.url season_url(season, format: :json)
end
