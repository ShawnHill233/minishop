class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.references :product, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
