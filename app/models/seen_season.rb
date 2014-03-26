class SeenSeason < ActiveRecord::Base
  belongs_to :user
  belongs_to :season

  validates :user, :season, presence: true
end
