class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.references :variant
      t.references :order
      t.integer    :quantity,                               null: false
      t.decimal    :price,    precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
