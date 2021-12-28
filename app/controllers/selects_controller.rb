class SelectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food

  def create
    @select = Select.new(user_id: current_user.id, food_id:@food.id)
    @select.save
  end

  def destroy
    @select = Select.find_by(user_id: current_user.id, food_id:@food.id)
    @select.destroy!
  end

  private
  def set_food
    @food = Food.find(params[:food_id])
  end
end