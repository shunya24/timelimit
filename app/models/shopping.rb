class Shopping < ApplicationRecord
  belongs_to :user
  has_many :checks, dependent: :destroy
  has_many :check_users, through: :checks, source: :user
  validates :name, length: { minimum: 1, maximum: 11 }
end
