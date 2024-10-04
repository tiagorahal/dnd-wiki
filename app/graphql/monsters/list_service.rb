module Monsters
  class ListService
    def self.call(page, sort_order = 'asc', sort_by = 'name')
      monster_list = DndApiService.get_monster_list["results"]

      sorted_monster_list = monster_list.sort_by { |monster| monster[sort_by] }

      sorted_monster_list.reverse! if sort_order == 'desc'

      paginated_monster_list = Kaminari.paginate_array(sorted_monster_list).page(page).per(15)

      monster_details = paginated_monster_list.map do |monster|
        details = DndApiService.get_monster_details(monster["index"])

        if details.nil?
          Rails.logger.error("Failed to fetch details for monster: #{monster['index']}")
          next
        else
          {
            name: details["name"],
            image: details['image'].present? ? "https://www.dnd5eapi.co#{details['image']}" : nil,
            type: details["type"] || "Unknown type",
            index: details["index"]
          }
        end
      end.compact

      { monsters: monster_details, pagination: paginated_monster_list }
    end
  end
end
