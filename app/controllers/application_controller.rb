class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :null_sessions
  helper_method :current_user, :authenticate_user

  def current_user
  	User.find_by(id: session[:user_id])
  end

  def authenticate_user
  	unless current_user
  		flash.now[:notice] = "You must be logged in to get full access to our tickets!" 
  		redirect_to sessions_path(:new)
  	end
  end
end
