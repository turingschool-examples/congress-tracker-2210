class PropublicaService
    def self.get_senate_member_data
        response = conn.get("/congress/v1/116/senate/members.json")
        parse_body(response)
    end

    def self.house_member_data(state)
        response = conn.get("/congress/v1/members/house/#{state}/current.json")
        parse_body(response)
    end 

    def self.conn 
        Faraday.new(url: "https://api.propublica.org") do |faraday|
            faraday.headers["X-API-KEY"] = ENV['govt_api_key']
        end
    end 

    def self.parse_body(response)
        JSON.parse(response.body, symbolize_names: true)
    end 
end 