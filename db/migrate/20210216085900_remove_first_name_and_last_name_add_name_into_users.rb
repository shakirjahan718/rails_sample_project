class RemoveFirstNameAndLastNameAddNameIntoUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    add_column :users, :name, :string
  end
end
