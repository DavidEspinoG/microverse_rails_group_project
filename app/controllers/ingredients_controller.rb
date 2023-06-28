class IngredientsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
  end

  def create
    @food = Food.new(name: params[:name],
                     quantity: params[:quantity], price: params[:price])
    @recipe = Recipe.find(params[:recipe_id])
    return unless @food.save

    @recipe.foods.push(@food)
    # @food.recipes.push(@recipe)
    redirect_to recipe_path(@recipe)
  end
end
