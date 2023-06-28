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
    @food = current_user.foods.build(food_params)

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
    redirect_to recipes_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def food_params
    params.require(:food).permit(:name, :quantity)
  end
end
