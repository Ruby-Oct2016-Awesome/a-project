class Station < ApplicationRecord
	has_many :bicycles

	geocoded_by :address  #if latLng values empty, based on address, automatically fills out latLng (latitude longitude) values
	after_validation :geocode, :if => :address_changed?
end
