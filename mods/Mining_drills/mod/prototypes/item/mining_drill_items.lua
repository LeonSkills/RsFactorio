require("__RsUtility__.scripts.prototypes")

local miners = require("data.miner-data")

for material, item_data in pairs(miners) do
  create_item({
    name = "rs-"..material.."-mining-drill",
    subgroup = "rs-miners-"..item_data.energy_type,
    order = "rs-miner-"..item_data.level,
    stack_size = 50,
    icon = "__RsMiningDrills__/graphics/icons/rs-"..material.."-mining-drill.png",
    icon_size = 32
  }, true)
end