class CreatePropertitesPrototypes < ActiveRecord::Migration[5.1]
  def change
    create_table :propertites_prototypes do |t|
      t.references :property, foreign_key: true
      t.references :prototype, foreign_key: true

      t.timestamps
    end
  end
end
