require 'rails_helper'

RSpec.describe '/recipes view', type: :system do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  let!(:recipe) do
    Recipe.create name: 'Pizza',
                  public: true, user:, preparation_time: '2 hours', description: 'Dummy description'
  end

  it 'should show the recipes titles' do
    visit '/users/sign_in'
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    find_button('Log in').click
    find_link('Recipes').click
    expect(page).to have_content(recipe.name)
  end
  it 'should show the recipes preparation times' do
    visit '/users/sign_in'
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    find_button('Log in').click
    find_link('Recipes').click
    expect(page).to have_content(recipe.preparation_time)
  end
  it 'should show the recipes descriptions' do
    visit '/users/sign_in'
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    find_button('Log in').click
    find_link('Recipes').click
    expect(page).to have_content(recipe.description)
  end
  it 'should not show a deleted recipe' do
    visit '/users/sign_in'
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    find_button('Log in').click
    find_link('Recipes').click
    accept_confirm do
      find_link('Delete recipe').click
    end
    expect(page).not_to have_content(recipe.name)
  end
end
