class CreatePhotoSeries < ActiveRecord::Migration
  def change
    create_table :photo_series do |t|
      t.string :name, null: false
      t.text :description
      t.string :file
      t.string :path
      t.references :series, index: true

      t.timestamps
    end
  end
end
