# app/services/dnd_api_service.rb
require 'httparty'

class DndApiService
  include HTTParty
  base_uri 'https://www.dnd5eapi.co/api'

  def self.get_resource(resource_path)
    response = get(resource_path)
    raise "Error: #{response.code}" unless response.success?
    
    response.parsed_response
  end

  def self.query_graphql(query, variables = {})
    response = post(
      'https://www.dnd5eapi.co/graphql',
      headers: { 'Content-Type' => 'application/json' },
      body: { query: query, variables: variables }.to_json
    )

    raise "Error: #{response.code}" unless response.success?
    
    response.parsed_response
  end
end
