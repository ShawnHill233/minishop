class CreateProductBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :product_brands do |t|
      t.references :product, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
