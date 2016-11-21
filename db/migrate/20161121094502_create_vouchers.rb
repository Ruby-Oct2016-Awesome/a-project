class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.string :name
      t.string :type
      t.integer :quantity
      t.integer :discount_info
      t.integer :aircredit_price
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
