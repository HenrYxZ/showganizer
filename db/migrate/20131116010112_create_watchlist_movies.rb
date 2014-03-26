class CreateWatchlistMovies < ActiveRecord::Migration
  def change
    create_table :watchlist_movies do |t|
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
