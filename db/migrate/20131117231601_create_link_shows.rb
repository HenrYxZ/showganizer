class CreateLinkShows < ActiveRecord::Migration
  def change
    create_table :link_shows do |t|
    	t.string :link_text
    	t.references :show, index: true
      	t.timestamps
    end
  end
end
