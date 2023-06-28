require 'rails_helper'

RSpec.describe 'Home view', type: :system do
  context 'When the user is not authenticated' do
    it 'should show log in button' do 
      visit '/'
      expect(page).to have_content('Log in')
    end
    it 'should show sign up button' do 
      visit '/'
      expect(page).to have_content('Sign up')
    end
    it 'should show the title' do 
      visit '/'
      expect(page).to have_content('Recipe app')
    end
  end
  context 'When the user is authenticated' do 
    let!(:user) {User.create name: 'David', email: 'david@mail.com', password: 'password'}
    it 'should show the users name' do 
      visit '/users/sign_in'
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      find_button('Log in').click
      expect(page).to have_content('David')
    end
  end
end