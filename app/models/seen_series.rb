class SeenSeries < ActiveRecord::Base
  belongs_to :user
  belongs_to :series

  validates :user, :series, presence: true
end
