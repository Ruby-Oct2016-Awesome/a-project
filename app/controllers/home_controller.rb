class HomeController < ApplicationController
  def index
    if !current_user && session[:first_time] == nil
      session[:first_time] = false
      redirect_to page_path("scrolling-nav")
    end
  end

  def community
  	@trips = Trip.all
  	@distance_traveled = Trip.all.group_by_day(:created_at).sum(:distance)
  	@air_credits = Trip.all.group_by_day(:created_at).sum(:air_credit_earned)
  end
end
