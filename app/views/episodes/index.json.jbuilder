json.array!(@episodes) do |episode|
  json.extract! episode, :name, :release_date, :description, :number, :season_id
  json.url episode_url(episode, format: :json)
end
