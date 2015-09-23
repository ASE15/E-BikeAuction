class AuctionController < ApplicationController

  def index
    @bike = Bike.find(params[:bike_id])
    @bikes = [@bike]
  end

  def show
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.auction
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.build_auction
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.create_auction(auction_params)
    @bike.save

    redirect_to bike_auction_path(@bike, @auction)
  end

  def edit
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.auction
  end

  def update
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.auction
    if @auction.update(auction_params)
      redirect_to @auction
    else
      render 'edit'
    end
  end

  def destroy
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.auction
    @auction.destroy

    redirect_to bikes_path
  end

  private
  def auction_params
    params.require(:auction).permit(:enddate)
  end

end
