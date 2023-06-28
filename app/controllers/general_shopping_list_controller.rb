class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
    @general_food = @user.foods

    @missing_foods = []
    @total_cost = 0

    @recipes.each do |recipe|
      missing_foods = recipe.foods - @general_food
      @missing_foods.concat(missing_foods)
    end

    @missing_foods.flatten.each do |food|
      total = food.quantity * food.price
      @total_cost += total
    end
  end
end
