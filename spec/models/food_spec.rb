require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    before do
      @food = Food.new(name: "Mango", measuring_unit: "kg", price: 400, quantity: 4, user: @user)
    end

    it 'food created should be valid' do
        expect(@food).to be_valid
      end
  
      it 'name, measuring unit, price quantity of the food should be present' do
        expect(@food.name).to be_present
        expect(@food.measuring_unit).to be_present
        expect(@food.price).to be_present
        expect(@food.quantity).to be_present
      end
  
      it 'name shoud be present' do
        @food.name = nil
        expect(@food.name).to be_nil
      end

      it 'Price should be a number' do
        @food.price = 'One'
        expect(@food).to_not be_valid
      end
    
      it 'Price should be a number bigger than 0' do
        @food.price = -1
        expect(@food).to_not be_valid
      end

      it 'Quantity should be a number' do
        @food.quantity = 'One'
        expect(@food).to_not be_valid
      end
    
      it 'Quantity should be a number bigger than 0' do
        @food.quantity = -10
        expect(@food).to_not be_valid
      end
  end
end