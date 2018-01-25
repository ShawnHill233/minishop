class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string     :name,                 default: '', null: false
      t.text       :description
      t.boolean    :available,            default: true
      t.integer    :position

      t.timestamps null: false
    end
  end
end
