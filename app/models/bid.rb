class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :amount, presence: true
  validates :auction, presence: true
  validates :user, presence: true
end
