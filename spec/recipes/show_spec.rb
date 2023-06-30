require 'rails_helper'

RSpec.describe '/recipe/:id path', type: :system do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  let!(:recipe) do
    Recipe.create name: 'Pizza',
                  public: true, user:, preparation_time: '2 hours', description: 'Dummy description'
  end
  context 'the public/private button' do
    it 'should change text' do
      visit '/users/sign_in'
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      find_button('Log in').click
      find_link('Recipes').click
      find_link('Recipe details').click
      find_button('Make private').click
      expect(page).to have_button('Make public')
    end
  end
  context 'add ingredient button' do
    it 'should redirect to new ingredient path' do
      visit '/users/sign_in'
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      find_button('Log in').click
      find_link('Recipes').click
      find_link('Recipe details').click
      find_link('Add ingredient').click
      expect(page).to have_content('Add new ingredient')
    end
  end
end
