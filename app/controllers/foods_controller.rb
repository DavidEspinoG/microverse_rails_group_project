class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @foods = @user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(name: params[:name], quantity: params[:quantity],
                     user: current_user)

    if @food.save
      redirect_to foods_path, notice: 'Food added successfully.'
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    @food.update(name: params[:name], quantity: params[:quantity],
                 price: params[:price])
    redirect_to recipe_path(@food.recipes.first)
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_back(fallback_location: root_path)
  end

  # def food_params
  #   params.require(:food).permit(:name, :quantity)
  # end
end
