require 'rails_helper'

RSpec.describe '/recipes view', type: :system do 
  let!(:user) {User.create name: 'David', email: 'david@mail.com', password: 'password'}
  let!(:recipe) {Recipe.create name: 'Pizza', public: true, user: user}
  
  it 'should show the recipes titles' do 
    visit '/users/sign_in'
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    find_button('Log in').click
    find_link('Recipes').click
    expect(page).to have_content(recipe.name)
  end
end