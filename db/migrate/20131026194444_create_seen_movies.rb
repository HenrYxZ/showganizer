class CreateSeenMovies < ActiveRecord::Migration
  def change
    create_table :seen_movies do |t|
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
