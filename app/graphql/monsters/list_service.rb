module Monsters
  class ListService
    def self.call(page)
      monster_list = DndApiService.get_monster_list["results"]

      paginated_monster_list = Kaminari.paginate_array(monster_list).page(page).per(15)
      
      monster_details = paginated_monster_list.map do |monster|
        details = DndApiService.get_monster_details(monster["index"])
        {
          name: details["name"],
          image: "https://www.dnd5eapi.co#{details['image']}",
          alignment: details["alignment"] || "Unknown alignment",
          type: details["type"] || "Unknown type",
          index: details["index"]
        }
      end

      { monsters: monster_details, pagination: paginated_monster_list }
    end
  end
end
