class RemoveUserFromPostTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :first_name
    remove_column :posts, :last_name
  end
end
