class CreateSeenSeries < ActiveRecord::Migration
  def change
    create_table :seen_series do |t|
      t.references :user, index: true
      t.references :series, index: true

      t.timestamps
    end
  end
end
