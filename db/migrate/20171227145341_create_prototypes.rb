class CreatePrototypes < ActiveRecord::Migration[5.1]
  def change
    create_table :prototypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
