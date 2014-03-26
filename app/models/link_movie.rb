class LinkMovie < ActiveRecord::Base
	belongs_to :movie
	belongs_to :user

	validates :user, :movie, presence: true
end