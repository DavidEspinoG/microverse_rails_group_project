class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
    @general_food = @user.foods

    @missing_foods = []
    @recipes.each do |recipe|
      missing_foods = recipe.foods - @general_food
      @missing_foods.push(missing_foods)
    end
  end

end