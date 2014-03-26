class PhotoSeries < ActiveRecord::Base
  belongs_to :series
  belongs_to :user
  has_attached_file :data, :default_url => "missing.png",     
  	:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
end
