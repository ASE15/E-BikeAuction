class Auction < ActiveRecord::Base
  belongs_to :bike
  has_many :bids, :inverse_of => :auction, :dependent => :destroy

  validates :current_amount, presence: true, :numericality => { :greater_than_or_equal_to => 1 }

  def actualize
    if self.bids.count>0
      actualize_prize
    end

    #manage_time_left
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
          manage_time_left
        end
      end
    end

  end

  def get_highest_bid
    sort_bids = bids.sort_by{ |b| b.amount }.reverse
    sort_bids[0]
  end

  def manage_time_left
    #if (self.endtime - DateTime.now).to_i * 1440 < 5
    now = DateTime.now
    now = now.change(:offset => "+0000")
    if (self.endtime - now) / 60 < 5
      self.endtime = self.endtime + 15.minutes
    else
      self.endtime = self.endtime + 1.hours
    end
  end

  def is_running?
    now = DateTime.now
    now = now.change(:offset => "+0000")
    self.endtime > now
  end
end
