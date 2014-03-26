class AddUserRefToPhotoShows < ActiveRecord::Migration
  def change
    add_reference :photo_shows, :user, index: true
  end
end
