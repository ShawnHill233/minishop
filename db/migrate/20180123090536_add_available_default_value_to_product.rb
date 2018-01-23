class AddAvailableDefaultValueToProduct < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :available, :boolean, :default => true
  end
end
