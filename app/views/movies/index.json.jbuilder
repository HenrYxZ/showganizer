json.array!(@movies) do |movie|
  json.extract! movie, :name, :release_date, :description, :number, :show_id,
  :category
  json.url movie_url(movie, format: :json)
end
