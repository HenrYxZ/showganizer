class RemoveTypeOfShowFromShows < ActiveRecord::Migration
  def change
    remove_column :shows, :type_of_show, :string
  end
end
