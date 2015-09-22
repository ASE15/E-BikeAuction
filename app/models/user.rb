class User < ActiveRecord::Base
  has_many :bikes
  has_many :bids
end
