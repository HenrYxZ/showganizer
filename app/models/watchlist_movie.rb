class WatchlistMovie < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, presence: true
end
