class FoodsController < ApplicationController
  before_action :set_food, only: [:edit, :update]
  before_action :authenticate_user!
  protect_from_forgery with: :exception, only: :create

  def index
    followings = current_user.followings.pluck(:id)
    followers = current_user.followers.pluck(:id)
    mutual_follow = followings & followers
    mutual_follow.push(current_user.id)

    @foods = Food.where(user_id: mutual_follow).order("updated_at DESC")
  end

  def new
    @food = current_user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to root_path(@food), notice: '保存できました'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to root_path(@food), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy!
    redirect_to root_path, notice: '削除できました'
  end

  def destroy_all
    selects = current_user.selects.pluck(:food_id)
    foods = Food.where(id: selects)
    if foods.exists?
      foods.destroy_all
      redirect_to root_path, notice: '削除できました'
    else
      redirect_to root_path, notice: '１つ以上選択してください'
    end
  end

  private
  def food_params
    params.require(:food).permit(:image, :name, :content, :management, :limit, :count, :remove_image)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
