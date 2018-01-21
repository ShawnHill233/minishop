class AddPositionToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :position, :integer
  end
end
