class CreateSeenSeasons < ActiveRecord::Migration
  def change
    create_table :seen_seasons do |t|
      t.references :user, index: true
      t.references :season, index: true

      t.timestamps
    end
  end
end
