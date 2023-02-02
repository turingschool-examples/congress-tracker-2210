class CongressFacade 
    def self.senate_member_by_name(search_term)
        data = CongressService.senate_members

        members = data[:results][0][:members]
        found_members = members.find_all {|m| m[:last_name] == search_term}
        SenateMember.new(found_members.first)
    end 

    def self.house_representatives(state)
        data = CongressService.representatives_by_state(state)
        results = data[:results]
        results.map do |house_member_data|
            HouseMember.new(house_member_data)
        end 
    end 
end 