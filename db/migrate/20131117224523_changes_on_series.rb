class ChangesOnSeries < ActiveRecord::Migration
  def change
  	remove_column :photo_series, :name
  	remove_column :photo_series, :file
  	remove_column :photo_series, :path
  end
end
