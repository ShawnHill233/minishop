class CreatePropertiesPrototypes < ActiveRecord::Migration[5.1]
  def change
    create_table :properties_prototypes do |t|
      t.references :prototype, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
