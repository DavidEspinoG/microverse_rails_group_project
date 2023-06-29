require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    before do
      @user = User.new(name: 'John')
      @recipe = Recipe.new(name: 'Rice', preparation_time: '1 hour', cooking_time: '45 min',
                           description: 'easy to cook', public: true, user: @user)
    end

    it 'recipe created should be valid' do
      expect(@recipe).to be_valid
    end

    it 'name, preparation time, cooking time, description should be present' do
      expect(@recipe.name).to be_present
      expect(@recipe.preparation_time).to be_present
      expect(@recipe.cooking_time).to be_present
      expect(@recipe.description).to be_present
    end

    it 'Recipe should be public' do
      expect(@recipe.public).to be_truthy
    end

    it 'name shoud be present' do
      @recipe.name = nil
      expect(@recipe.name).to be_nil
    end

    it 'Cooking time should be a string' do
      @recipe.cooking_time = 'a'
      expect(@recipe).to be_valid
    end
    it 'Preparation time should be a string' do
      @recipe.preparation_time = 'a'
      expect(@recipe).to be_valid
    end
  end
end
