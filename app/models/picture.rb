class Picture < ActiveRecord::Base
  belongs_to :bike
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
end
