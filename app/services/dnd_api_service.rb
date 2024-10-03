class DndApiService
    include HTTParty
    base_uri 'https://www.dnd5eapi.co/api'
  
    def self.get_monster_list
      response = get('/monsters')
      raise "Error: #{response.code}" unless response.success?
  
      response.parsed_response
    end
  
    def self.get_monster_details(monster_index)
      response = get("/monsters/#{monster_index}")
      raise "Error: #{response.code}" unless response.success?
  
      response.parsed_response
    end
  end
  