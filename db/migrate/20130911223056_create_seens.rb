class CreateSeens < ActiveRecord::Migration
  def change
    create_table :seens do |t|
      t.references :user, index: true
      t.references :show, index: true

      t.timestamps
    end
  end
end
