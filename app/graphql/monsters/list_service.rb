module Monsters
    class ListService
      def self.call
        monster_list = DndApiService.get_monster_list["results"]
  
        limited_monster_list = monster_list.first(5)
  
        monster_details = limited_monster_list.map do |monster|
          details = DndApiService.get_monster_details(monster["index"])
          {
            name: details["name"],
            type: details["type"] || "Unknown type",
            image: "https://www.dnd5eapi.co#{details['image']}",
            alignment: details["alignment"] || "Unknown alignment",
            index: details["index"]
          }
        end
  
        monster_details
      end
    end
  end
  