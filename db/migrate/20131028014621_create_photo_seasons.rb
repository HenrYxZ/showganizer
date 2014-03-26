class CreatePhotoSeasons < ActiveRecord::Migration
  def change
    create_table :photo_seasons do |t|
      t.string :name, null: false
      t.text :description
      t.string :file
      t.string :path
      t.references :season, index: true

      t.timestamps
    end
  end
end
