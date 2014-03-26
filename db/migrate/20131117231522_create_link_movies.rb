class CreateLinkMovies < ActiveRecord::Migration
  def change
    create_table :link_movies do |t|
    	t.string :link_text
    	t.references :movie, index: true
      	t.timestamps
    end
  end
end
