class HomeController < ApplicationController
  def index
    if !current_user && session[:first_time] == nil
      session[:first_time] = false
      redirect_to page_path("scrolling-nav")
    end

    @trips = Trip.all
    @distance_traveled = Trip.all.group_by_day(:created_at).sum(:distance)
    @air_credits = Trip.all.group_by_day(:created_at).sum(:air_credit_earned)

    @leaderboard = User.joins(trips: :user).group(:email).sum(:distance).sort {|a,b| a[1] <=> b[1]}.reverse #makes array of user_id => distance [4, 10]... 
  end

  def community
  	@trips = Trip.all
  	@distance_traveled = Trip.all.group_by_day(:created_at).sum(:distance)
  	@air_credits = Trip.all.group_by_day(:created_at).sum(:air_credit_earned)
  end
end
