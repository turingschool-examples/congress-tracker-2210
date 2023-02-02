require 'rails_helper'
RSpec.describe 'State House Member Search' do
  describe 'happy path' do
    before :each do
        stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json").
           to_return(status: 200, body: File.read('spec/fixtures/house_members_in_CO_response.json'), headers: {})
      end

    it 'allows user to search for house members by state' do
        
      visit root_path

      select "Colorado", :from => "state"
      click_button 'Search By State'

      expect(page.status_code).to eq 200
      expect(page).to have_content("8 Results")
      within(".house-member-Joe-Neguse") do 
        expect(page).to have_content("Joe Neguse")
        expect(page).to have_content("Representative")
        expect(page).to have_content("D")
        expect(page).to have_content("2")
      end 
    end
  end
end