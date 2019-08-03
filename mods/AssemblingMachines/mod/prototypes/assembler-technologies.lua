
require("__RsUtility__.utility.prototypes")
require("__RsUtility__.utility.util")
local assemblers = require("data.assembler-data")

local prev_tech
for tier, item_data in pairs(assemblers) do
  if tier > 1 then
    local tech_name
    if tier == 2 then
      tech_name = "automation"
    else
      tech_name = "automation-"..(tier-1)
    end
    local tech = get_prototype(tech_name, "technology")
    tech.icon = "__base__/graphics/technology/automation.png"
    tech.icon_size = 128
    tech.localised_description = {
        "technology-description."..tech_name
      }
    tech.order = "rs-technology-automation-"..add_leading_zeros(tier, 3)

    tech.prerequisites = item_data.prerequisites

    if prev_tech then
      table.insert(tech.prerequisites, prev_tech)
    end

    local ingredients
    if mods["RsSmithing"] then
      ingredients = to_packs(item_data.mod_ingredients)
    else
      ingredients = to_packs(item_data.vanilla_ingredients)
    end

    tech.unit = {
      count = item_data.tech_count,
      ingredients = ingredients,
      time = item_data.tech_time
    }

    table.insert(tech.prerequisites, ingredients[#ingredients][1])

    prev_tech = tech_name
  end
end