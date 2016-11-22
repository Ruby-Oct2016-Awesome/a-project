class StationsController < ApplicationController
	before_action :set_station, only: [:show, :edit, :update, :destroy]

	def index
		if params[:search].present?
		  @stations = Station.near(params[:search], 50, :order => :distance)
		else
		  @stations = Station.all
		end
	end

	def show
	end


	def new
		@station = Station.new
	end

	def create
		@station = Station.create station_params
		if @station.persisted?
			flash[:success] = "Station created successfully"
			redirect_to stations_path
		else
			flash.now[:error] = "Error: #{@station.errors.full_messages.to_sentence}"
			render 'new'
		end
	end

	def destroy
		@station.destroy
		respond_to do |format|
		  format.html { redirect_to stations_url, notice: 'Location was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end

	def edit
	end

	def update
		respond_to do |format|
		  if @station.update(station_params)
		    format.html { redirect_to @station, notice: 'Location was successfully updated.' }
		    format.json { render :show, status: :ok, station: @station }
		  else
		    format.html { render :edit }
		    format.json { render json: @station.errors, status: :unprocessable_entity }
		  end
		end
	end



	private

	def set_station
		@station = Station.find(params[:id])
	end

	def station_params
		params.require(:station).permit(:name, :address, :latitude, :longitude)
	end


end
