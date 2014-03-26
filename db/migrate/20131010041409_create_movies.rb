class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.date :release_date
      t.text :description
      t.integer :number
      t.references :show, index: true

      t.timestamps
    end
  end
end
