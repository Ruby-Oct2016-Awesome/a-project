class Station < ApplicationRecord
	has_many :bicycles
	validates :name, :latitude, :longitude, presence: true, uniqueness: { scope: [:latitude, :longitude] }

	geocoded_by :address  #if latLng values empty, based on address, automatically fills out latLng (latitude longitude) values
	after_validation :geocode, :if => :address_changed?
	#validates :latitude, uniqueness: { scope: :longitude }

end
