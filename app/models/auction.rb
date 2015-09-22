class Auction < ActiveRecord::Base
  belongs_to :bike
  has_many :bids
end
