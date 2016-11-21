class Trip < ApplicationRecord
	belongs_to :user
end

=begin
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
=end