class AddTripForeignKeyToUserTable < ActiveRecord::Migration[7.0]
  def change
    def change
      add_reference :posts, :trip, foreign_key: true
    end
  end
end
