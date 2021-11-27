class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, ImageUploader


  validates :nickname, presence: true
  validates :nickname, length: {maximum: 13}

  validates :my_id, presence: true
  validates :my_id, {uniqueness: true}
  validates :my_id, length: {maximum: 13}
end
