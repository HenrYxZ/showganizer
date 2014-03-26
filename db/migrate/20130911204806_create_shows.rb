class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
