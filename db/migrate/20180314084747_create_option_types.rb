class CreateOptionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :option_types do |t|
      t.string :name
      t.string :presentation
      t.integer :position

      t.timestamps
    end
    add_index :option_types, :name
    add_index :option_types, :position
  end
end
