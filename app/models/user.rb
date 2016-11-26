class User < ApplicationRecord
	#require 'rqrcode'

	has_secure_password
	has_many :teams
	has_many :orders
	has_many :vouchers, through: :orders
	has_many :trips

	#qr = RQRCode::QRCode.new( User.email, :size => 4, :level => :h )
	#p qr.to_s

end
