class CreateLinkSeries < ActiveRecord::Migration
  def change
    create_table :link_series do |t|
    	t.string :link_text
    	t.references :series, index: true
      	t.timestamps
    end
  end
end
