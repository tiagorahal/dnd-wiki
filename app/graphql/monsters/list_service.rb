module Monsters
  class ListService
    def self.call(page, sort_order = 'asc')
      monster_list = DndApiService.get_monster_list["results"]

      sorted_monster_list = monster_list.sort_by { |monster| monster['name'] }
      sorted_monster_list.reverse! if sort_order == 'desc'

      paginated_monster_list = Kaminari.paginate_array(sorted_monster_list).page(page).per(15)
      
      monster_details = paginated_monster_list.map do |monster|
        details = DndApiService.get_monster_details(monster["index"])
        {
          name: details["name"],
          image: "https://www.dnd5eapi.co#{details['image']}",
          type: details["type"] || "Unknown type",
          index: details["index"]
        }
      end

      { monsters: monster_details, pagination: paginated_monster_list }
    end
  end
end
