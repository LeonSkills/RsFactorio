
require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")
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
    local prerequisites = item_data.prerequisites or {}
    table.insert(prerequisites, prev_tech)
    create_technology({
      name = tech_name,
      recipes_to_unlock = {
        "rs-"..item_data.material.."-assembling-machine"
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
      icon = "__base__/graphics/technology/automation.png",
      icon_size = 128,
      extra_prerequisites = prerequisites
    }, false, true, true)
    prev_tech = tech_name
  end
end