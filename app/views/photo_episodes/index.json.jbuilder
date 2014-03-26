json.array!(@photo_episodes) do |photo_episode|
  json.extract! photo_episode, :path, :episode_id
  json.url photo_episode_url(photo_episode, format: :json)
end
