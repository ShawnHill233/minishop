class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string     :number,               limit: 15
      t.decimal    :item_total,                         precision: 8, scale: 2, default: 0.0, null: false
      t.decimal    :total,                              precision: 8, scale: 2, default: 0.0, null: false
      t.string     :state

      t.references :user
      t.datetime   :completed_at
      t.references :ship_address
      t.decimal    :payment_total,                      precision: 8, scale: 2, default: 0.0
      t.string     :payment_state
      t.text       :special_instructions

      t.timestamps
    end
  end
end
