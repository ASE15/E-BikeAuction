class Auction < ActiveRecord::Base
  belongs_to :bike
  has_many :bids

  def actualize
    if self.bids.count>0
      actualize_prize
    end

    manage_time_left
    #self.save
    #redirect_to auction_path(@auction)
  end

  def actualize_prize
    sort_bids = bids.sort_by{ |b| b.amount }.reverse
    highest_bid = sort_bids[0]
    if sort_bids.count > 1
      second_highest_bid = sort_bids[1]
      if highest_bid != second_highest_bid
        if(highest_bid.user != second_highest_bid.user)
          self.current_amount = second_highest_bid.amount + 1
        end
      end
    end

  end

  def manage_time_left
    if (self.endtime - Time.now)  < 5.minutes
      self.endtime = self.endtime + 15.minutes

    end
  end
end
