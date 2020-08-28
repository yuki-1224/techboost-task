class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :discription, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
