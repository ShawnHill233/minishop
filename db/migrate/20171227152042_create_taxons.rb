class CreateTaxons < ActiveRecord::Migration[5.1]
  def change
    create_table :taxons do |t|
      t.string :name
      t.references :taxonomy, foreign_key: true

      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true
      t.string :icon_file_name
      t.string :description
      t.integer :position
      t.integer :depth, :null => false, :default => 0

      t.timestamps
    end
  end
end
