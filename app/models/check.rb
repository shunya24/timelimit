class Check < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :shopping, dependent: :destroy
end
