class CreateWatchlistEpisodes < ActiveRecord::Migration
  def change
    create_table :watchlist_episodes do |t|
      t.references :user, index: true
      t.references :episode, index: true

      t.timestamps
    end
  end
end
