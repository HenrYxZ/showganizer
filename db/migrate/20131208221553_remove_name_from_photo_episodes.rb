class RemoveNameFromPhotoEpisodes < ActiveRecord::Migration
  def change
    remove_column :photo_episodes, :name, :string
  end
end
