class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show, :edit, :update, :destroy]

  def index
    @bicycles = Bicycle.all.order(created_at: :desc)
  end

  def new
    @bicycle = Bicycle.new
  end

  def show
  end

  def create
    @bicycle = Bicycle.create bicycle_params
    if @bicycle.persisted?
      flash[:success] = "Bicycle created successfully"
      redirect_to bicycles_path
    else
      flash.now[:error] = "Error: #{@bicycle.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  def update
    if @bicycle.update(bicycle_params)
      redirect_to @bicycle, notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @bicycle.destroy
    redirect_to bicycles_path, notice: 'Bicycle was successfully destroyed.'
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def bicycle_params
    params.require(:bicycle).permit(:station_id)
  end

end
