json.array!(@reviews) do |review|
  json.extract! review, :title, :body, :rating, :user_id, :show_id, :movie_id, :series_id, :season_id, :episode_id
  json.url review_url(review, format: :json)
end
