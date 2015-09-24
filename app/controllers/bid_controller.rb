class BidController < ApplicationController
  def new
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.create
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
          flash[:error] = 'Bid not created'
        end
      else
        flash[:error] = 'Bid not created'
      end
      redirect_to auction_path(@auction)
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
    @auction.endtime > DateTime.current
  end

end
