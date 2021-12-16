class ChecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shopping

  def create
    @check = Check.new(user_id: current_user.id, shopping_id:@shopping.id)
    @check.save

  end

  def destroy
    @check = Check.find_by(user_id: current_user.id, shopping_id:@shopping.id)
    @check.destroy!
  end

  private
  def set_shopping
    @shopping = Shopping.find(params[:shopping_id])
  end
end
