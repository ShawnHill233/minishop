class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string     :name,                 default: '', null: false
      t.text       :description
      t.boolean    :available

      t.timestamps null: false
    end

    add_index :spree_products, [:name],         name: 'index_spree_products_on_name'
  end
end
