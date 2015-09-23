class Bike < ActiveRecord::Base
  belongs_to :user
  has_one :auction
  has_many :pictures, :inverse_of => :bike, :dependent => :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
