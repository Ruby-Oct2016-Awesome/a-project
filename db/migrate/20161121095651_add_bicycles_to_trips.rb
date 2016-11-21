class AddBicyclesToTrips < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :bicycle, foreign_key: true
    add_reference :trips, :user, foreign_key: true
  end
end
