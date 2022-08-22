class AddTripToPostsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :trip, foreign_key: true
  end
end
