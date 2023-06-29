require 'rails_helper'

RSpec.describe '/foods path', type: :system do
  let!(:user) { User.create name: 'David', email: 'david@mail.com', password: 'password' }
  let!(:food) { Food.create name: 'Pineapple', user: }
  let!(:food_two) { Food.create name: 'Strawberry' }
  it 'should show the user name' do
    login_as(user)
    visit foods_path
    expect(page).to have_content(user.name)
  end
  it 'should show the user\'s food name' do
    login_as(user)
    visit foods_path
    expect(page).to have_content(food.name)
  end
  it 'should not show other user\'s food name' do
    login_as(user)
    visit foods_path
    expect(page).not_to have_content(food_two.name)
  end
end
