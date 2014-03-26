class CreatePhotoMovies < ActiveRecord::Migration
  def change
    create_table :photo_movies do |t|
      t.string :name, null: false
      t.text :description
      t.string :file
      t.string :path
      t.references :movie, index: true
      t.timestamps
    end
  end
end
