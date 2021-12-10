class ShoppingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shoppings = Shopping.where(user_id: current_user)
  end

  def new
    @shopping = current_user.shoppings.build
  end

  def create
    @shopping = current_user.shoppings.build(shopping_params)
    if @shopping.save
      redirect_to shoppings_path(@shopping), notice: '保存できました'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def edit
    @shopping = Shopping.find(params[:id])
  end

  def update
    @shopping = Shopping.find(params[:id])
    if @shopping.update(shopping_params)
      redirect_to shoppings_path(@shopping), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    shopping = Shopping.find(params[:id])
    shopping.destroy!
    redirect_to shoppings_path, notice: '削除できました'
  end

  private
  def shopping_params
    params.require(:shopping).permit(:name)
  end
end
