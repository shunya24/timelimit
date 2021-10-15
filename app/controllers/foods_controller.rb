class FoodsController < ApplicationController
  before_action :set_food, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @foods = Food.all
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
    @food = Food.find(params[:id])
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

  private
  def food_params
    params.require(:food).permit(:image, :name, :content, :management, :limit, :count)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
