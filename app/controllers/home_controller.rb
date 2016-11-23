class HomeController < ApplicationController
  def index
    if !current_user && session[:first_time] == nil
      session[:first_time] = false
      redirect_to page_path("scrolling-nav")
    end
  end
end
