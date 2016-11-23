class AddUniqueIndexToOrders < ActiveRecord::Migration[5.0]
  def change
  	add_index :orders, [:user_id, :voucher_id], unique: true
  end
end
