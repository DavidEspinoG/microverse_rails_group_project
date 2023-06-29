class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
    @general_food = @user.foods

    @missing_foods = []
    @total_cost = 0

    @recipes.each do |recipe|
      missing_foods = recipe.foods.reject { |food| @general_food.any? { |general_food| general_food.name == food.name } }
      @missing_foods.concat(missing_foods)
    end

    @missing_foods.flatten.each do |food|
      if food.quantity && food.price
        total = food.quantity * food.price
        @total_cost += total
      end
    end
    
  end
end
