class User < ApplicationRecord
	has_secure_password
	has_many :teams
	has_many :orders
	has_many :trips
end
