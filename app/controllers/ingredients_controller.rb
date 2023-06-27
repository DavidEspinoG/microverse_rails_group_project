class IngredientsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
  end
end
