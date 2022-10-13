class PropublicaService
    def self.get_senate_member_data
        conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
            faraday.headers["X-API-KEY"] = ENV['govt_api_key']
        end
        response = conn.get("/congress/v1/116/senate/members.json")
      
        data = JSON.parse(response.body, symbolize_names: true)
    end 
end 