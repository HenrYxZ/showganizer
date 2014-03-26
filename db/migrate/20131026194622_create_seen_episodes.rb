class CreateSeenEpisodes < ActiveRecord::Migration
  def change
    create_table :seen_episodes do |t|
      t.references :user, index: true
      t.references :episode, index: true

      t.timestamps
    end
  end
end
