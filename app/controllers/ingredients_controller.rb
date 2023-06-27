class IngredientsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
  end

  def create
    @food = Food.new(name: params[:name], 
      quantity: params[:quantity], user: current_user)
    @recipe = Recipe.find(params[:recipe_id])
    if @food.save
      @recipe.foods.push(@food)
      redirect_to recipe_path(@recipe)
    end
  end
end