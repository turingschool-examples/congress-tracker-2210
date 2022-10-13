class SenateMember 
    attr_reader :first_name, :last_name, :twitter_account
    
    def initialize(member_data)
        @first_name = member_data[:first_name]
        @last_name = member_data[:last_name]
        @twitter_account = member_data[:twitter_account]
    end 

end 