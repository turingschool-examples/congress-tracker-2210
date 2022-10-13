class CongressFacade 
    def self.find_senate_member(search_term)
        data = PropublicaService.get_senate_member_data
        members = data[:results][0][:members]
  
        found_members = members.find_all {|m| m[:last_name] == search_term}
        senate_member = SenateMember.new(found_members.first)
        # require 'pry';binding.pry
    end

    def self.house_members_by_state(state)
        data = PropublicaService.house_member_data(state)[:results]
        data.map do |house_mem_data|
            HouseMember.new(house_mem_data)
        end 
    end
end 