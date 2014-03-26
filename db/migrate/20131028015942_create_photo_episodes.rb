class CreatePhotoEpisodes < ActiveRecord::Migration
  def change
    create_table :photo_episodes do |t|
      t.string :name, null: false
      t.text :description
      t.string :file
      t.string :path
      t.references :episode, index: true

      t.timestamps
    end
  end
end
