class SeenEpisode < ActiveRecord::Base
  belongs_to :user
  belongs_to :episode

  validates :user, :episode, presence: true
end
