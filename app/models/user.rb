class User < ActiveRecord::Base
	
	has_many :seen, dependent: :destroy
	has_many :shows, through: :seen

	has_many :seen_movie, dependent: :destroy
	has_many :movies, through: :seen_movie

	has_many :seen_series, dependent: :destroy
	has_many :series, through: :seen_series

	has_many :seen_season, dependent: :destroy
	has_many :seasons, through: :seen_season

	has_many :seen_episode, dependent: :destroy
	has_many :episodes, through: :seen_episode

	has_many :trailers, dependent: :destroy

	has_many :reviews
	has_attached_file :avatar,
		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml")

	validates :name,  presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	#has_secure_password
	
	def self.authenticate(email, password)
  		User.find_by(email: email, password: password)
  	end
end