class Movie < ActiveRecord::Base
  belongs_to :show

  validates :number, numericality: {greater_than_or_equal_to: 0}
  validates :name, uniqueness: true
  validates :category, presence: true

  has_many :seen_movies, dependent: :destroy
  has_many :watchlist_movies, dependent: :destroy
  has_many :photo_movies, :dependent => :destroy
  has_many :link_movies, :dependent => :destroy
  has_many :reviews, dependent: :destroy
  has_many :trailers, dependent: :destroy
end
