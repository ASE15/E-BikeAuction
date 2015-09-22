class Picture < ActiveRecord::Base
  belongs_to :bike
  validates :bike, presence: true
  mount_uploader :picture, PictureUploader
end
