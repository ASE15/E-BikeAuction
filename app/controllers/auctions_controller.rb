class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
    @bike = @auction.bike
  end
end
