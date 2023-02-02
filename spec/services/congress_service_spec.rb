require 'rails_helper'

RSpec.describe CongressService do
    # format of the response 
    # data types that the values come back as
    # I want to make sure that all of the keys/vales that i use in my code, are 
    # in the same spot and data type that my code relies on them exisitng in. 
    before :each do
        stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
        to_return(status: 200, body: File.read('spec/fixtures/propublica_response.json'), headers: {})
    end

    it 'can return one senate member object' do 
        response = CongressService.senate_members 
        # binding.pry
        expect(response).to have_key(:results)
        expect(response[:results]).to be_a(Array)
        expect(response[:results][0]).to have_key(:members)
        expect(response[:results][0][:members]).to be_a(Array)
        response[:results][0][:members].each do |member_data|
            expect(member_data[:first_name]).to be_a(String)
            expect(member_data[:last_name]).to be_a(String)
            expect(member_data).to have_key(:twitter_account)
        end 
        # expect(response[:results][0][:members].first).to have_key(:first_name)
        # expect(response[:results][0][:members].first).to have_key(:last_name)
        # expect(response[:results][0][:members].first).to have_key(:twitter_account)
    end 
end 