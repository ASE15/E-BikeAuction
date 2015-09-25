class BidController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bid.create
  end

  def create
      @auction = Auction.find(params[:auction_id])
      @bid = @auction.bids.create(bid_params)
      if is_bid_valid
        @bid.user = current_user
        if @bid.save
          @auction.actualize
          @auction.save
          flash[:notice] = 'Bid created'
        else
          flash[:error] = 'Bid not created [only numbers allowed]'
        end
      else
        flash[:error] = 'Bid not created [the bid is invalid]'
      end
      redirect_to auction_path(@auction)
  end

  def show
    @bid = Bid.find(params[:id])
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end



  def is_bid_valid
   #@auction.bike.user != current_user and is_bid_high_enough and is_bid_within_time
   is_bid_high_enough and is_bid_within_time

  end

  def is_bid_high_enough
    @auction.current_amount.to_i < @bid.amount.to_i
  end

  def is_bid_within_time
    now = DateTime.now
    now = now.change(:offset => "+0000")
    @auction.endtime > now
  end

end