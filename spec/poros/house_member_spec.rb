require "rails_helper"

RSpec.describe HouseMember do
  it "exists" do
    member_data = {:id=>"D000197",
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
        :seniority=>"26",
        :next_election=>"2022",
        :api_uri=>"https://api.propublica.org/congress/v1/members/D000197.json",
        :district=>"1",
        :at_large=>false}

    member = HouseMember.new(member_data)

    expect(member).to be_a HouseMember
    expect(member.name).to eq("Diana DeGette")
    expect(member.role).to eq("Representative")
    expect(member.party).to eq("D")
    expect(member.district).to eq("1")
  end
end