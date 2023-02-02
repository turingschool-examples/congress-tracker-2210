class HouseMember 
    attr_reader :first_name, :last_name, :name, :role, :party, :district
    def initialize(house_member_data)
        @first_name = house_member_data[:first_name]
        @last_name = house_member_data[:last_name]
        @name = house_member_data[:name]
        @role = house_member_data[:role]
        @party = house_member_data[:party]
        @district = house_member_data[:district]
    end

end 