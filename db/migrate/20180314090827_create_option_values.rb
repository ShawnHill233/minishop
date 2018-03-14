class CreateOptionValues < ActiveRecord::Migration[5.1]
  def change
    create_table :option_values do |t|
      t.integer :position
      t.string :name
      t.string :presentation
      t.references :option_type, foreign_key: true

      t.timestamps
    end
  end
end
