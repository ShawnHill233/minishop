class CreateProductOptionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_option_types do |t|
      t.integer :position
      t.references :product, foreign_key: true
      t.references :option_type, foreign_key: true

      t.timestamps
    end
  end
end
