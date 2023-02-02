require 'rails_helper'

RSpec.describe CongressFacade do
    # return value of the method
    before :each do
        stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
        to_return(status: 200, body: File.read('spec/fixtures/propublica_response.json'), headers: {})
    end
    it 'can return one senate member object' do 
        senate_member = CongressFacade.senate_member_by_name("Warren")
        
        expect(senate_member).to be_an_instance_of(SenateMember)
    end 
end 