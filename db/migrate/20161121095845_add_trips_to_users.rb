class AddTripsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :trip, foreign_key: true
  end
end
