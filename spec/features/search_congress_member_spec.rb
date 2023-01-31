require 'rails_helper'

RSpec.describe 'Govt Search' do
  describe "sad path" do
  
  end
  describe 'happy path' do
    before :each do
      stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
         to_return(status: 200, body: File.read('spec/fixtures/propublica_response.json'), headers: {})
    end

    it 'allows user to search for govt members' do
      visit root_path

      fill_in :search, with: 'Sanders'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Bernard Sanders was found!")
      expect(page).to have_content("SenSanders")
    end

    it 'allows user to search for another govt member' do
      visit root_path

      fill_in :search, with: 'Booker'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Cory Booker was found!")
      expect(page).to have_content("SenBooker")
    end
  end
end