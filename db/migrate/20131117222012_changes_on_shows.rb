class ChangesOnShows < ActiveRecord::Migration
  def change
  	remove_column :photo_shows, :name
  	remove_column :photo_shows, :file
  	remove_column :photo_shows, :path
  end
end
