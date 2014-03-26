class LinkSeries < ActiveRecord::Base
	belongs_to :series
	belongs_to :user
end
