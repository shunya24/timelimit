# frozen_string_literal: true

module ApplicationHelper
  def add_active_food_class(controller)
    'active' if (controller) == "foods"
  end

  def add_active_shopping_class(controller)
    'active' if (controller) == "shoppings"
  end
end
