class AuctionsController < ApplicationController

  before_filter :owns_auction!, :only => [:update, :edit, :destroy]

  def index

    if params[:search] and not params[:search].empty?

      #@bikes = Bike.search_each(params[:search])
      @auctions = Array[]
      @bikes = Bike.search_each(params[:search])
      @bikes.each do |b|
        if not b.auction.nil?
          @auctions.push(b.auction)
        end
      end
    else
      @auctions = Auction.all.to_a
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bike = @auction.bike
  end


  def edit
    #@bike = Bike.find(params[:bike_id])
    #@auction = @bike.auction
    @auction = Auction.find(params[:id])

    if @auction.bids.count > 0
      flash[:error] = 'The auction already has bids! You cannot edit it.'
      redirect_to auction_path(@auction)
    end
  end

  def update
    #@bike = Bike.find(params[:bike_id])
    @auction = Auction.find(params[:id])
    if @auction.update(auction_params)
      redirect_to auction_path(@auction)
    else
      render 'edit'
    end
  end

  def destroy
    #@bike = Bike.find(params[:bike_id])
    @auction = Auction.find(params[:id])

    if @auction.bids.count > 0
      flash[:error] = 'The auction already has bids! You cannot delete it.'
      redirect_to auction_path(@auction)
    else

      @auction.destroy

      redirect_to bikes_path
    end
  end

  private
  def auction_params
    params.require(:auction).permit(:endtime, :current_amount)
  end
end
