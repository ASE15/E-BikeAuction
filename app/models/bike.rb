class Bike < ActiveRecord::Base
  belongs_to :user
  has_one :auction
  has_many :picture
end
