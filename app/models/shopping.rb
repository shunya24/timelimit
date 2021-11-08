class Shopping < ApplicationRecord
  belongs_to :user
  has_many :checks, dependent: :destroy
  validates :name, length: { minimum: 1, maximum: 11 }
end
