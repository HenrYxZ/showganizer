json.array!(@series) do |series|
  json.extract! series, :name, :start_date, :end_date, :description, :number,
  :category, :show_id, :seasons_id
  json.url series_url(series, format: :json)
end
