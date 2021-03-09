class AddManufacturerIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :manufacturer_id, :integer
  end
end
