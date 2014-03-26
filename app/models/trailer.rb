class Trailer < ActiveRecord::Base

	belongs_to :show
	belongs_to :movie
	belongs_to :series
	belongs_to :season
	belongs_to :episode
	belongs_to :user

	validates :url, presence: true
	validates :user, presence: true

end
