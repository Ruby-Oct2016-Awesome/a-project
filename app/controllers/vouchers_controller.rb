class VouchersController < ApplicationController
  before_action :set_voucher, only: [:show, :edit, :update, :destroy]

  def index
    @vouchers = Voucher.all.order(created_at: :desc)
  end

  def new
    @voucher = Voucher.new
  end

  def list
    @vouchers = Voucher.all.order(created_at: :desc)
  end

  def show
  end

  def create
    @voucher = Voucher.create voucher_params
    # TODO: NEED TO REMOVE THIS LATER
    @voucher.expired_at = Date.today + 60.days
    @voucher.save!
    if @voucher.persisted?
      flash[:success] = "Voucher created successfully"
      redirect_to vouchers_path
    else
      flash.now[:error] = "Error: #{@voucher.errors.full_messages.to_sentence}"
      render 'new'
    end
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
    @voucher.destroy
    redirect_to vouchers_path, notice: 'Voucher was successfully destroyed.'
  end

  private

  def set_voucher
    @voucher = Voucher.find(params[:id])
  end

  def voucher_params
    params.require(:voucher).permit(:name, :voucher_type, :quantity, :discount_info, :aircredit_price, :description, :status)
  end

end
