class TripsController < ApplicationController
	before_action :set_trip, only: [:show, :edit, :update, :destroy]

	def index
		@trips = Trip.all
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

	private

	def set_trip
		@trip = Trip.find(params[:id])
	end

	def trip_params
	  params.require(:trip).permit(:start_latitude, :start_longitude, :end_latitude, :end_longitude)
	end
end
