class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string     :name
      t.string     :presentation

      t.timestamps null: false
    end
  end
end
