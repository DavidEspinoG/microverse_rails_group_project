require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    before do
      @ingredient = Ingredient.new(quantity: 4, food_id: 1, recipe_id: 2)
    end

    it "ingredients should be present" do
      expect(@ingredient).to be_present
    end
  end
end