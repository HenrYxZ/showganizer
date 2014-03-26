class CreateWatchlistShows < ActiveRecord::Migration
  def change
    create_table :watchlist_shows do |t|
      t.references :user, index: true
      t.references :show, index: true

      t.timestamps
    end
  end
end
