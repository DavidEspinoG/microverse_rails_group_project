require 'rails_helper'
RSpec.describe 'add new ingredient view', type: :system do 
  let!(:user) {User.create name: 'David', email: 'david@mail.com', password: 'password'}
  let!(:recipe) {Recipe.create name: 'Pizza', 
      public: true, user: user, preparation_time: '2 hours', description: 'Dummy description'}
  after(:all) do 
    Warden.test_reset! 
  end
  it 'should show the name of the recipe' do
    login_as(user, :scope => :user)
    visit create_ingredient_path(recipe)
    expect(page).to have_content(recipe.name)
  end
end
