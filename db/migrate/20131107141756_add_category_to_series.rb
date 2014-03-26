class AddCategoryToSeries < ActiveRecord::Migration
  def change
    add_column :series, :category, :string
  end
end
