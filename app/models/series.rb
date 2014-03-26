class Series < ActiveRecord::Base
  belongs_to :show
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons, dependent: :destroy

  validates :number, numericality: {greater_than_or_equal_to: 0}
  validates :name, uniqueness: true, presence: true
  validates :category, presence: true
  
  has_many :seen_series, dependent: :destroy
  has_many :watchlist_series, dependent: :destroy
  has_many :photo_series, dependent: :destroy
  has_many :link_series, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :trailers, dependent: :destroy
end
