class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.string     :sku,                                         default: '',    null: false
      t.decimal    :cost_price,         precision: 8, scale: 2
      t.decimal    :weight,        precision: 8, scale: 2
      t.decimal    :height,        precision: 8, scale: 2
      t.decimal    :width,         precision: 8, scale: 2
      t.decimal    :depth,         precision: 8, scale: 2

      t.boolean    :is_master,                                   default: false
      t.references :product
      t.integer    :position
      t.datetime   :discontinue_on

      t.timestamps
    end
  end
end
