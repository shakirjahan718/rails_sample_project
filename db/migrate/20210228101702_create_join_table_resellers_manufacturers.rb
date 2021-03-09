class CreateJoinTableResellersManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :manufacturers, :resellers do |t|
      # t.index [:manufacturer_id, :reseller_id]
      # t.index [:reseller_id, :manufacturer_id]
    end
  end
end
