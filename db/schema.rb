# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161122064448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bicycles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "station_id"
    t.index ["station_id"], name: "index_bicycles_on_station_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "voucher_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
    t.index ["voucher_id"], name: "index_orders_on_voucher_id", using: :btree
  end

  create_table "stations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.float    "start_latitude"
    t.float    "start_longitude"
    t.float    "end_latitude"
    t.float    "end_longitude"
    t.datetime "started_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "bicycle_id"
    t.integer  "user_id"
    t.index ["bicycle_id"], name: "index_trips_on_bicycle_id", using: :btree
    t.index ["user_id"], name: "index_trips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "credit_card"
    t.string   "air_credit"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "trip_id"
    t.integer  "team_id"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
    t.index ["trip_id"], name: "index_users_on_trip_id", using: :btree
  end

  create_table "vouchers", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "quantity"
    t.integer  "discount_info"
    t.integer  "aircredit_price"
    t.datetime "date"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "bicycles", "stations"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "vouchers"
  add_foreign_key "teams", "users"
  add_foreign_key "trips", "bicycles"
  add_foreign_key "trips", "users"
  add_foreign_key "users", "teams"
  add_foreign_key "users", "trips"
end
