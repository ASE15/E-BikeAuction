class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
  validates :auction, presence: true
  validates :user, presence: true
end
