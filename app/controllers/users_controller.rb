class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:code, :nearby, :voucher, :personal, :setting]

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
  end

  def nearby
  end

  def voucher
  end

  def personal
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
