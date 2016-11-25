class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :destroy]

	def index
		@vouchers = current_user.vouchers
	end

	def show

	end

	def new
		@voucher = Voucher.find(params[:voucher_id])
		@order = Order.new
	end

	# def redeem
	# 	@voucher = Voucher.find(params[:voucher_id])
	# 	@order = Order.new
	# end

	def purchase
	end

	def create
		# @voucher = Voucher.find(params[:voucher_id])
		@order = Order.create order_params
		if @order.persisted?
			flash[:success] = "Your voucher is added to your voucher list"
			redirect_to vouchers_path
		else
			flash[:error] = "You're only allowed to redeem a voucher once!"
			redirect_to vouchers_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private

	def order_params
	  params.require(:order).permit(:user_id, :voucher_id) 	
	end


	def set_order
		@order = Order.find(params[:id])
	end

end
