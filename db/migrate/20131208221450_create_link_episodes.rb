class CreateLinkEpisodes < ActiveRecord::Migration
  def change
    create_table :link_episodes do |t|
      t.string :link_text
      t.references :user, index: true
      t.references :episode, index: true

      t.timestamps
    end
  end
end
