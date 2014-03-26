class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  belongs_to :movie
  belongs_to :series
  belongs_to :season
  belongs_to :episode

  validates :rating, presence: true
  validates :user, presence: true

end
