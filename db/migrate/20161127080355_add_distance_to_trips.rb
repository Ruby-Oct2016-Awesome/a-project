class AddDistanceToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :distance, :float
    add_column :trips, :air_credit_earned, :integer
  end
end
