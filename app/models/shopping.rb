class Shopping < ApplicationRecord
  belongs_to :user
  has_one :check, dependent: :destroy
end
