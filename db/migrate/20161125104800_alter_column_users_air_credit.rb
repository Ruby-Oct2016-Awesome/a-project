class AlterColumnUsersAirCredit < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :air_credit
  	add_column :users, :air_credit, :integer
  end
end
