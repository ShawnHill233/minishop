class AddDetailsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :details, :text
  end
end
