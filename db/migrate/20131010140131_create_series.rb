class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :number
      t.references :show, index: true
      t.references :seasons, index: true

      t.timestamps
    end
  end
end
