class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.references :line_itemable, polymorphic: true, index: true
      t.references :variant
      t.integer    :quantity,                               null: false, default: 1
      t.decimal    :price,    precision: 8, scale: 2, null: false
      t.boolean    :checked,  default: true

      t.timestamps
    end
  end
end
