require 'rails_helper'

RSpec.describe HouseMember do
    it 'exists and has attributes' do 
        data = {:id=>"D000197",
            :name=>"Diana DeGette",
            :first_name=>"Diana",
            :middle_name=>nil,
            :last_name=>"DeGette",
            :suffix=>nil,
            :role=>"Representative",
            :gender=>"F",
            :party=>"D",
            :times_topics_url=>nil,
            :twitter_id=>"RepDianaDeGette",
            :facebook_account=>"DianaDeGette",
            :youtube_id=>"RepDianaDeGette",
            :seniority=>"28",
            :next_election=>"2024",
            :api_uri=>"https://api.propublica.org/congress/v1/members/D000197.json",
            :district=>"1",
            :at_large=>false}
        house_member = HouseMember.new(data)

        expect(house_member).to be_an_instance_of(HouseMember)
        expect(house_member.first_name).to eq("Diana")
        expect(house_member.last_name).to eq("DeGette")
        expect(house_member.name).to eq("Diana DeGette")
        expect(house_member.role).to eq("Representative")
        expect(house_member.party).to eq("D")
    end 

end 

