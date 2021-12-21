class ShoppingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shoppings = Shopping.where(user_id: current_user).order(created_at: :desc)
  end

  def new
  end

  def create
    @shopping = current_user.shoppings.build(shopping_params)
    if @shopping.save
    else
      redirect_to shoppings_path(@shopping), notice: '１文字から１１文字で入力してください'
    end
  end

  def destroy
    @shopping = Shopping.find(params[:id])
    @shopping.destroy!
  end

  private
  def shopping_params
    params.require(:shopping).permit(:name)
  end
end
