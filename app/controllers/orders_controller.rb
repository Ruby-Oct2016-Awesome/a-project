class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :new, :create, :destroy]
	before_action :set_user, only: [:new, :create, :destroy]

	def index
		@orders = Order.all
	end

	def show

	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.create order_params
		if @station.persisted?
			flash[:success] = "Order was successfully created"
			redirect_to orders_path
		else
			flash.now[:error] = "Error: #{@station.errors.full_messages.to_sentence}"
			render 'new'
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

	def set_user
		current_user = User.find(params[:user_id])
	end

end
