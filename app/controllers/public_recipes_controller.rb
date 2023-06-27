class PublicRecipesController < ApplicationController
  def index
    @public_recipe = Recipe.where(public: true).order(created_at: :desc).includes(:user)
  end
end
