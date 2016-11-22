class VouchersController < ApplicationController
	def index
		@vouchers = Voucher.all
	end

	def show
	end
	

	private

	def set_voucher
		@voucher = Voucher.find(params[:id])
	end

end
