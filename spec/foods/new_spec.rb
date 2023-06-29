require 'rails_helper'

RSpec.describe '/foods/new path', type: :system do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  it 'should show the user\'s name' do
    login_as(user)
    visit new_food_path
    expect(page).to have_content(user.name)
  end
  it 'should show food name when new food is created' do
    login_as(user)
    visit new_food_path
    fill_in('Name', with: 'Carrot')
    fill_in('Quantity', with: '1')
    fill_in('Price', with: '10')
    find_button('Add Food').click
    expect(page).to have_content('Carrot')
  end
end
