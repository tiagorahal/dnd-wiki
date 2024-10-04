module Monsters
  class ShowService
    def self.call(monster_index)
      details = DndApiService.get_monster_details(monster_index)
      return nil if details.nil?

      {
        name: details["name"],
        desc: details["desc"] || "No description available",
        size: details["size"] || "Unknown size",
        type: details["type"] || "Unknown type",
        subtype: details["subtype"] || "None",
        alignment: details["alignment"] || "Unknown alignment",
        hit_points: details["hit_points"] || "Unknown hit points",
        armor_class: details["armor_class"]&.map { |ac| "#{ac['value']} (#{ac['type']})" }.join(", ") || "No armor class available",
        speed: details["speed"] || { "walk" => "Unknown" },
        proficiencies: details["proficiencies"] || [],
        senses: details["senses"] || { "passive_perception" => "Unknown" },
        languages: details["languages"] || "None",
        challenge_rating: details["challenge_rating"] || "Unknown",
        special_abilities: details["special_abilities"] || [],
        actions: details["actions"] || [],
        xp: details["xp"] || "Unknown",
        image: details['image'] ? "https://www.dnd5eapi.co#{details['image']}" : asset_path('dndtemplate.webp')
      }
    end
  end
end
