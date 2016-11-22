class Bicycle < ApplicationRecord
	belongs_to :station
	has_many :trips
end
