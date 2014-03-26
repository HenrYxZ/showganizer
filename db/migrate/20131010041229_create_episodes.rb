class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.date :release_date
      t.text :description
      t.integer :number
      t.references :season, index: true

      t.timestamps
    end
  end
end
