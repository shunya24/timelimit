class Shopping < ApplicationRecord
  belongs_to :user
  has_many :checks, dependent: :destroy
end
