class UsersController < ApplicationController
  require 'rqrcode'

  before_filter :authenticate_user, :only => [:code, :nearby, :voucher, :personal, :setting, :admin]
  before_filter :authenticate_admin, :only => [:admin]

  #below necessary?
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      session[:user_id] = @user.id
      flash[:success] = "Registered successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  def code
    @user = current_user
    @qr = RQRCode::QRCode.new(@user.email + @user.created_at.to_s, :size => 8, :level => :h )
  end

  def nearby
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      session[:user_id] = @user.id
      flash[:success] = "Account successfully updated"
      redirect_to :back
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'edit'
    end
  end

  def edit_credit_card
    @user = current_user
  end

  def update_credit_card
    @user = current_user
    if @user.update(user_cc_params)
      flash[:success] = "Credit Card successfully updated"
      redirect_to setting_users_path
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'edit_credit_card'
    end
  end

  def voucher
  end

  def personal
  end

  def setting
    if current_user.credit_card = nil
      redirect_to edit_credit_card_path(id: @current_user.id)
    end
  end

  def admin
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation)
  end

  def user_cc_params
    params.require(:user).permit(:credit_card)
  end

end
