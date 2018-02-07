class AddVehicleTypeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :vehicle_type, :string
  end
end
