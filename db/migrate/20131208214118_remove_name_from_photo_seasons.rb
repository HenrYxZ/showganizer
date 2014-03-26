class RemoveNameFromPhotoSeasons < ActiveRecord::Migration
  def change
    remove_column :photo_seasons, :name, :string
  end
end
