class AddCityColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city_id, :integer
  end
end
