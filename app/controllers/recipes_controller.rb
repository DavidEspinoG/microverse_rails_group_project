class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new name: params[:name], preparation_time: params[:preparation_time],
                         cooking_time: params[:cooking_time], description: params[:description],
                         public: params[:public], user: current_user
    if @recipe.save
      redirect_to '/recipes'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to '/recipes'
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to recipe_path(@recipe)
  end
end
