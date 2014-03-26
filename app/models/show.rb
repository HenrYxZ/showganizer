	class Show < ActiveRecord::Base
	has_many :seen, dependent: :destroy
	has_many :watchlist_shows, dependent: :destroy
	has_many :reviews, dependent: :destroy
	
	has_many :movies, dependent: :destroy
	has_many :series, dependent: :destroy

	has_many :seasons, through: :series, dependent: :destroy
	has_many :episodes, through: :seasons, dependent: :destroy

	has_many :photo_shows, dependent: :destroy
	has_many :link_shows, dependent: :destroy

	has_many :trailers, dependent: :destroy

	validates :name, uniqueness: true, presence: true
	validates :category, presence: true

	#attr_accessor :name

	def self.search(name)
		where("name like ?", "%#{name.downcase}%")
	end
end