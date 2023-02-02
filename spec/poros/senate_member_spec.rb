require 'rails_helper'

RSpec.describe SenateMember do
    it 'exists and has attributes' do 
        data = {:id=>"W000817",
            :title=>"Senator, 1st Class",
            :short_title=>"Sen.",
            :api_uri=>"https://api.propublica.org/congress/v1/members/W000817.json",
            :first_name=>"Elizabeth",
            :middle_name=>nil,
            :last_name=>"Warren",
            :suffix=>nil,
            :date_of_birth=>"1949-06-22",
            :gender=>"F",
            :party=>"D",
            :leadership_role=>nil,
            :twitter_account=>"SenWarren",
            :facebook_account=>"senatorelizabethwarren",
            :youtube_account=>"senelizabethwarren",
            :next_election=>"2024",
            :total_votes=>717,
            :missed_votes=>283,
            :total_present=>1,
            :last_updated=>"2020-12-30 19:01:18 -0500",
            :ocd_id=>"ocd-division/country:us/state:ma",
            :office=>"309 Hart Senate Office Building",
            :phone=>"202-224-4543",
            :fax=>nil,
            :state=>"MA",
            :senate_class=>"1",
            :state_rank=>"senior",
            :lis_id=>"S366",
            :missed_votes_pct=>39.47,
            :votes_with_party_pct=>78.67,
            :votes_against_party_pct=>21.33}
        senate_member = SenateMember.new(data)

        expect(senate_member).to be_an_instance_of(SenateMember)
        expect(senate_member.first_name).to eq("Elizabeth")
        expect(senate_member.last_name).to eq("Warren")
        expect(senate_member.twitter_account).to eq("SenWarren")
        expect(senate_member.full_name).to eq("Elizabeth Warren")
    end 
    # it '.full_name' do 

    # end 
end 