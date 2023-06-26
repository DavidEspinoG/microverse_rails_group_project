class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new name: params[:name], preparation_time: params[:preparation_time],
                         cooking_time: params[:cooking_time], description: params[:description],
                         public: params[:public], user: current_user
    if @recipe.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
