class AddColumnDescriptionPhotoShow < ActiveRecord::Migration
  def change
  	add_column :photo_shows, :description, :text
  end
end
