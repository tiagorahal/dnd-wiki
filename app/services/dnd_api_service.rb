class DndApiService
  include HTTParty
  base_uri 'https://www.dnd5eapi.co/api'
  DEFAULT_TIMEOUT = 10 # seconds

  def self.get_monster_list
    response = get('/monsters', timeout: DEFAULT_TIMEOUT)
    raise "Error: #{response.code}" unless response.success?

    response.parsed_response
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    Rails.logger.error("DndApiService Timeout: #{e.message}")
    nil
  end

  def self.get_monster_details(monster_index)
    response = get("/monsters/#{monster_index}", timeout: DEFAULT_TIMEOUT)
    raise "Error: #{response.code}" unless response.success?

    response.parsed_response
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    Rails.logger.error("DndApiService Timeout: #{e.message}")
    nil
  end
end
