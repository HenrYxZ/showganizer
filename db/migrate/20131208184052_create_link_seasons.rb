class CreateLinkSeasons < ActiveRecord::Migration
  def change
    create_table :link_seasons do |t|
      t.string :link_text
      t.references :user, index: true
      t.references :season, index: true

      t.timestamps
    end
  end
end
