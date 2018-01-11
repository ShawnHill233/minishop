class CreatePropertyPrototypes < ActiveRecord::Migration[5.1]
  def change
    create_table :property_prototypes do |t|
      t.references :property, foreign_key: true
      t.references :prototype, foreign_key: true

      t.timestamps
    end
  end
end
