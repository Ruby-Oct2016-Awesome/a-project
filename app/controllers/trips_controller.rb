class TripsController < ApplicationController
	before_action :set_user
	before_action :set_trip, only: [:show, :edit, :update, :destroy]

	def index
		@user = current_user
		@trips = Trip.where(user_id: current_user.id)	
		@distance_by_day = Trip.where(user_id: current_user.id).group_by_day(:created_at).sum(:distance)
		@air_credit_by_day = Trip.where(user_id: current_user.id).group_by_day(:created_at, format: "%m-%d").sum(:air_credit_earned)
	end

	def destroy
	  @trip.destroy
	  respond_to do |format|
	    format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

	def show
	end

	def my_trips

	end

	#def create
	#	if @trip.save?
	#		@user.air_credit += @trip.distance
	#	end
	#end

	private

	def set_trip
		@trip = Trip.find(params[:id])
	end

	def set_user
		@user = current_user
	end

	def trip_params
	  params.require(:trip).permit(:start_latitude, :start_longitude, :end_latitude, :end_longitude)
	end
end
