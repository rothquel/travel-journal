class AddNameToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :first_name, :string
    add_column :posts, :last_name, :string
  end
end
