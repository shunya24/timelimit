class ShoppingsController < ApplicationController
  def index
    @shoppings = Shopping.all
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

  private
  def shopping_params
    params.require(:shopping).permit(:name, :count)
  end
end
