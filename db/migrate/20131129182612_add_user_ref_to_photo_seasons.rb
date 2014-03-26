class AddUserRefToPhotoSeasons < ActiveRecord::Migration
  def change
    add_reference :photo_seasons, :user, index: true
  end
end
