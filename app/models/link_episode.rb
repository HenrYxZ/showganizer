class LinkEpisode < ActiveRecord::Base
  belongs_to :user
  belongs_to :episode
end
