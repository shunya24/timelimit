class Food < ApplicationRecord
  validates :name, presence: true
  validates :name, {length: {maximum:11} }

  mount_uploader :image, ImageUploader
  
  enum management: {賞味期限:1, 消費期限:2, 管理しない:3}
end
