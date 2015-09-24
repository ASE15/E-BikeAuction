class AuctionsController < ApplicationController
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
      @auctions = Auction.all
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bike = @auction.bike
  end
end
