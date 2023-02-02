require 'rails_helper'

RSpec.describe CongressFacade do
    # return value of the method
    before :each do
        stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
        to_return(status: 200, body: File.read('spec/fixtures/propublica_response.json'), headers: {})

        stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json").
        to_return(status: 200, body: File.read('spec/fixtures/house_members_in_CO_response.json'), headers: {})
    end
    it 'can return one senate member object' do 
        senate_member = CongressFacade.senate_member_by_name("Warren")

        expect(senate_member).to be_an_instance_of(SenateMember)
    end 
    it 'can return a collection of house members' do 
        house_members = CongressFacade.house_representatives("CO")

        expect(house_members).to be_a Array 
        house_members.each do |hm|
            expect(hm).to be_an_instance_of(HouseMember)
        end 
    end 
end 