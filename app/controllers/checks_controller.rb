class ChecksController < ApplicationController
  before_action :authenticate_user!

  def create
    shopping = Shopping.find(params[:shopping_id])
    shopping.checks.create!(user_id: current_user.id)
    redirect_to shoppings_path(shopping)
  end

  def destroy
    shopping = Shopping.find(params[:shopping_id])
    check = shopping.checks.find_by!(user_id: current_user.id)

    check.destroy!
    redirect_to shoppings_path(shopping)
  end
end
