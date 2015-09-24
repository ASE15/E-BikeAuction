class BikesController < ApplicationController

  before_action :authenticate_user!
  before_filter :owns_bike!, :only => [:update, :edit, :destroy]

  def index

    if params[:search] and not params[:search].empty?

      @bikes = Bike.search_each(params[:search])

    else
      #@bikes = Bike.order("created_at DESC")
      @bikes = Bike.all
    end
  end


  def mybikes
    @bikes = current_user.bikes
    render 'index'
  end


  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user

    if @bike.save
      redirect_to @bike
    else
      render 'new'
    end
  end

  def update
    @bike = Bike.find(params[:id])

    if @bike.update(bike_params)
      redirect_to @bike
    else
      render 'edit'
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy

    redirect_to bikes_path
  end

  private
  def bike_params
    params.require(:bike).permit(:name, :color, :weight, :batterytype, :kwh, :maxspeed, :brand, :chargingtime)
  end
end