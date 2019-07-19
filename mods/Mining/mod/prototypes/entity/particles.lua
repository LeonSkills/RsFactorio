
local ores = require("prototypes.entity.ore_data")
require("__RsUtility__.scripts.prototypes")


for ore_name, ore_data in pairs(ores) do
  local name = get_vanilla_name("rs-" .. ore_name)
  if ore_data.entity_mod ~= "base" then
    local particle = table.deepcopy(data.raw.particle["copper-ore-particle"])
    particle.name = name.."-particle"
    for i=1,4 do
      particle.pictures[i].filename = "__RsMining__/graphics/entity/".. ore_name .."-particle/".. ore_name .."-particle-"..i..".png"
      particle.pictures[i].hr_version.filename = "__RsMining__/graphics/entity/".. ore_name .."-particle/hr-".. ore_name .."-particle-"..i..".png"
    end
    data:extend({
      particle
    })
  end
end