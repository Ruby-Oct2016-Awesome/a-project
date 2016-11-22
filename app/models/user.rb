class User < ApplicationRecord
	has_secure_password
	has_many :teams
<<<<<<< HEAD
	has_many :team_users
=======
	has_many :orders
	has_many :trips
>>>>>>> 6c5a37f8382bdbb11804bb7c0b487b5b4299aac7
end
