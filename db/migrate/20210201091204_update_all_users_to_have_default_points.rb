class UpdateAllUsersToHaveDefaultPoints < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :points, :integer
    User.update_all(points: 100)
  end
end
