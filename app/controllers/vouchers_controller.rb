class VouchersController < ApplicationController
  before_action :set_voucher, only: [:show, :edit, :update, :destroy]

  def index
    @vouchers = Voucher.all.order(created_at: :desc)
  end

  def new
    @voucher = Voucher.new
  end

  def show
  end

  def create
  end

  def update
    if @voucher.update(voucher_params)
      redirect_to @voucher, notice: 'Voucher was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
  end

  private

  def set_voucher
    @voucher = Voucher.find(params[:id])
  end

  def voucher_params
    params.require(:voucher).permit(:name, :voucher_type, :quantity, :discount_info, :aircredit_price, :description, :status)
  end

end
