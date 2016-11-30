class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :null_sessions
  helper_method :current_user, :authenticate_user, :authenticate_admin, :today_day, :today_month


  def current_user
    return @current_user if @current_user
    if session[:user_id] && User.exists?(session[:user_id])
      @current_user = User.find(session[:user_id])
    end
  end

  def today_day
    @date = Time.now
    @date.strftime("%d")
  end

  def today_month
    @date = Time.now
    @date.strftime("%b")
  end

  def authenticate_user
    unless current_user
      flash.now[:notice] = "You must be logged in to get full access to our tickets!"
      redirect_to new_session_path
    end
  end

  def authenticate_admin
    unless current_user.is_admin
      flash.now[:notice] = "You're not authorized to access this. Stay away from this. I'm serious."
      redirect_to new_session_path
    end
  end

end
