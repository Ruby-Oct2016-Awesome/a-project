class AddCodeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :code, :integer
  end
end
