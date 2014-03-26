class FixColumnType < ActiveRecord::Migration
  def self.up
  	rename_column :shows, :type, :type_of_show
  end
  def self.down
  	rename_column :shows, :type_of_show, :type
  end
end
