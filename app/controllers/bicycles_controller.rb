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
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

end
