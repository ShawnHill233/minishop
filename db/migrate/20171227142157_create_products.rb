class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string     :name,                 default: '', null: false
      t.text       :description
      t.boolean    :available

      t.timestamps null: false
    end
  end
end
