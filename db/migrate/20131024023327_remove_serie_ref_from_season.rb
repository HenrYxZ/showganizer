class RemoveSerieRefFromSeason < ActiveRecord::Migration
  def change
    remove_reference :seasons, :serie, index: true
  end
end
