module Monsters
    class ShowService
      def self.call(monster_index)
        query = <<-GRAPHQL
          query($index: String!) {
            fetchMonster(index: $index) {
              name
              desc
              image
            }
          }
        GRAPHQL
  
        variables = { index: monster_index }
        DndApiService.query_graphql(query, variables)["data"]["fetchMonster"]
      end
    end
  end