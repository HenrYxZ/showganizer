class AddUserRefToPhotoEpisodes < ActiveRecord::Migration
  def change
    add_reference :photo_episodes, :user, index: true
  end
end
