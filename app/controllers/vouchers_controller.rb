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
  end

  def edit
  end

  def destroy
  end

  private

  def set_voucher
    @voucher = Voucher.find(params[:id])
  end

end
