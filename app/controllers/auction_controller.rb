class AuctionController < ApplicationController

  before_action :authenticate_user!
  before_filter :owns_bike!, :only => [:new, :create]

  def new
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.build_auction
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @auction = @bike.create_auction(auction_params)

    now = DateTime.now
    now = now.change(:offset => "+0000")
    if @auction.endtime < now
      flash[:error] = 'Endtime must be in the future'
      render 'new'
    elsif @auction.save
      redirect_to auction_path(@auction), notice: "You have started the auction!"
    else
      render 'new'
    end
  end

  private
  def auction_params
    params.require(:auction).permit(:endtime, :current_amount)
  end

end