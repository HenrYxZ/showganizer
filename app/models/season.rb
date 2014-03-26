class Season < ActiveRecord::Base
  belongs_to :series
  has_many :episodes, dependent: :destroy

  validates :series, presence: true
  validates :number, numericality: {greater_than_or_equal_to: 0}
  validates :name, uniqueness: true, presence: true

  has_many :photo_seasons, dependent: :destroy
  has_many :link_seasons, dependent: :destroy

  has_many :seen_seasons, dependent: :destroy
  has_many :watchlist_seasons, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :trailers, dependent: :destroy

  def category
  	this.series.category
  end
  
 end
 