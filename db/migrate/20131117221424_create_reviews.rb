class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating
      t.references :user, index: true
      t.references :show, index: true
      t.references :movie, index: true
      t.references :series, index: true
      t.references :season, index: true
      t.references :episode, index: true

      t.timestamps
    end
  end
end
