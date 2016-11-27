class User < ApplicationRecord

	before_save :default_values
	#attr_accessor :air_credit 

	has_secure_password
	has_many :teams
	has_many :orders
	has_many :vouchers, through: :orders
	has_many :trips

	def default_values
	  self.air_credit ||= 0
	end

end
