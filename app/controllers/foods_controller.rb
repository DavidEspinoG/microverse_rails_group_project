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

  private

  def food_params
    params.require(:food).permit(:name, :quantity)
  end
end
