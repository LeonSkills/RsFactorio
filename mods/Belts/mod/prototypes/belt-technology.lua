local belts = require("data.belt-data")
require("__RsBase__.scripts.prototypes")

for tier, item_data in pairs(belts) do
  local logistic_tier = tier - 1
  local material = item_data.name
  local tech_name = "logistics-"..logistic_tier
  if logistic_tier == 1 then
    tech_name = "logistics"
  end
  local extra_prerequisites = item_data.prerequisites
  if logistic_tier == 2 then
    table.insert(extra_prerequisites, "logistics")
  elseif logistic_tier > 0 then
    table.insert(extra_prerequisites, "logistics-"..(logistic_tier-1))
  end
  create_technology({
    name = tech_name,
    icon = "__base__/graphics/technology/logistics.png",
    icon_size = 128,
    recipes_to_unlock = {
      "rs-"..material.."-transport-belt",
      "rs-"..material.."-underground-belt",
      "rs-"..material.."-splitter"
    },
    unit = {
      count = item_data.tech_count,
      time = 15
    },
    levels = {
      ["construction"] = item_data.level,
      ["woodcutting"] = item_data.level,
      ["smithing"] = item_data.level
    },
    extra_prerequisites = extra_prerequisites,
  }, true, true, true)
end