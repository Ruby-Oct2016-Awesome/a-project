class Order < ApplicationRecord
  validates :user, uniqueness: { scope: :voucher }
  belongs_to :user
  belongs_to :voucher
end

#user has 1 order which has many vouchers? vouchers can't be repeated

=begin
 create_table "orders", force: :cascade do |t|
    t.integer  "voucher_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
    t.index ["voucher_id"], name: "index_orders_on_voucher_id", using: :btree
  end

=end