class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :url
      t.integer :show_id
      t.integer :movie_id
      t.integer :series_id
      t.integer :season_id
      t.integer :episode_id

      t.timestamps
    end
  end
end
