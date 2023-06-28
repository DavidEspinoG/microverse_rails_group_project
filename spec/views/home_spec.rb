require 'rails_helper'

RSpec.describe 'Home view', type: :system do
  context 'When the user is not authenticated' do
    it 'should show log in button' do 
      visit '/'
      expect(page).to have_content('Log in')
    end
  end
end