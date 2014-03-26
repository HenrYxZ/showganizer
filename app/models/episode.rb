class Episode < ActiveRecord::Base
  belongs_to :season

  validates :season, presence: true
  validates :number, numericality: {greater_than_or_equal_to: 0}
  validates :name, uniqueness: true, presence: true

  has_many :photo_episodes, dependent: :destroy
  has_many :link_episodes, dependent: :destroy

  has_many :seen_episodes, dependent: :destroy
  has_many :watchlist_episodes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :trailers, dependent: :destroy

  def category
  	this.season.category
  end
  
end
