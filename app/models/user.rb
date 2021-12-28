class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :shoppings, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_many :check_shoppings, through: :checks, source: :shopping
  has_many :selects, dependent: :destroy
  has_one :profile, dependent: :destroy



  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  def has_check?(shopping)
    checks.exists?(shopping_id: shopping.id)
  end

  def has_select?(food)
    selects.exists?(food_id: food.id)
  end

  def follow!(user)
    if user.is_a?(User)
      user_id = user.id
    else
      user_id = user
    end

    following_relationships.create!(following_id: user_id)
  end

  def unfollow!(user)
    if user.is_a?(User)
      user_id = user.id
    else
      user_id = user
    end

    relation = following_relationships.find_by!(following_id: user_id)
    relation.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end

  def avatar_image
    if profile&.avatar?
      profile.avatar_url
    else
      'user.png'
    end
  end
end
