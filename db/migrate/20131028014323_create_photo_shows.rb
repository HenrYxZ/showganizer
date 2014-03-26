class CreatePhotoShows < ActiveRecord::Migration
  def change
    create_table :photo_shows do |t|
      t.string :name, null: false
      t.string :path
      t.references :show, index: true
      t.string :file
      t.timestamps
    end
  end
end
