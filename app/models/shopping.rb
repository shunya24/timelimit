class Shopping < ApplicationRecord
  belongs_to :user
  belongs_to :check, dependent: :destroy
end
