class AddSeriesRefToSeason < ActiveRecord::Migration
  def change
    add_reference :seasons, :series, index: true
  end
end
