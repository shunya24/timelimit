class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :shoppings, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_one :profile, dependent: :destroy

  def has_check?(shopping)
    checks.exists?(shopping_id: shopping.id)
  end
end
