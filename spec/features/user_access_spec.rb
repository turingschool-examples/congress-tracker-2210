require 'rails_helper'
RSpec.describe 'User Authorization Spec' do
  describe 'happy path' do
    xit 'allows user to access dashboard, and search pages as a registered user', :vcr do
      user = User.create(email: 'meg@example.com', password: 'password123')

      visit '/login'

      fill_in :email, with: 'meg@example.com'
      fill_in :password, with: 'password123'

      click_button "Log In"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Welcome, meg@example.com")

      visit '/dashboard'

      select "Colorado", :from => "state"
      click_button 'Search By State'
      
      expect(page.status_code).to eq 200
      expect(current_path).to eq('/search_state')

      visit '/dashboard'
      fill_in :search, with: 'Sanders'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(current_path).to eq('/search')
    end
  end

  describe 'sad path' do 
    xit 'as a visitor, I cant access the dashboard page' do 
        visit '/dashboard'

        expect(current_path).to eq('/')
        expect(page).to have_content("You must be a registered user to access this page")
    end 

  end 
end