class Trip < ApplicationRecord
	belongs_to :user

    before_save :calculate_distance
    before_save :calculate_aircredit

    def calculate_distance
        self.distance = (Geocoder::Calculations.distance_between([start_latitude, start_longitude], [end_latitude, end_longitude])*1.61).round(2)
    end

    def calculate_aircredit
        self.air_credit_earned = self.distance * 15
    end

    def calculate_user_air_credit
        
    end # ** NEED TO DO SOMETHING TO AUTOMATICALLY UPDATE ATTR_ACCESSOR User.air_credit

    def distance_by_day
        result = Trip.group_by_day(:created_at).sum(:distance)
        render json: [{name: 'Distance Traveled', data: result}]
    end

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