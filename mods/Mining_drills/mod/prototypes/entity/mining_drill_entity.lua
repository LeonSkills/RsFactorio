require("__RsUtility__.scripts.prototypes")

local miners = require("data.miner-data")

for material, item_data in pairs(miners) do
  local item_name = "rs-" .. material .."-mining-drill"
  local factorio_name = get_vanilla_name(item_name)
  local miner = table.deepcopy(data.raw["mining-drill"][item_data.based_on])
  miner.name = factorio_name
  miner.icon = "__RsMiningDrills__/graphics/icons/".. item_name ..".png"
  miner.icon_size = 32
  miner.minable.result = factorio_name
  miner.next_upgrade = item_data.next_upgrade
  miner.resource_searching_radius = item_data.radius
  miner.energy_usage = item_data.energy_usage
  miner.mining_speed = item_data.mining_speed
  miner.mining_power = item_data.mining_power
  if item_data.module_slots > 0 then
    if miner.module_specification == nil then
      miner.allowed_effects = {"speed", "productivity", "consumption", "pollution"}
      miner.module_specification = {}
    end
    miner.module_specification.module_slots = item_data.module_slots
  end
  miner.radius_visualisation_picture = {
    filename = "__RsMiningDrills__/graphics/entity/".. item_name .."/".. item_data.based_on.."-radius-visualization.png",
    height = 10,
    width = 10
  }
  if item_data.energy_type == "burner" then
    for dir, short in pairs({north="N", east="E", south="S", west="W"}) do
      miner.animations[dir].layers[1].filename = "__RsMiningDrills__/graphics/entity/".. item_name .."/".. item_data.based_on.."-"..short..".png"
      miner.animations[dir].layers[1].hr_version.filename = "__RsMiningDrills__/graphics/entity/".. item_name .."/hr-".. item_data.based_on.."-"..short..".png"
      miner.animations[dir].layers[1].animation_speed = item_data.mining_speed * 2
      miner.animations[dir].layers[1].hr_version.animation_speed = item_data.mining_speed * 2
      miner.animations[dir].layers[2].animation_speed = item_data.mining_speed * 2
      miner.animations[dir].layers[2].hr_version.animation_speed = item_data.mining_speed * 2
    end
    miner.energy_source.emissions_per_minute=48*item_data.mining_speed
  elseif item_data.energy_type == "electric" then
    for dir, short in pairs({north="N", east="E", south="S", west="W"}) do
      miner.animations[dir].animation_speed = item_data.mining_speed
      miner.animations[dir].hr_version.animation_speed = item_data.mining_speed
      miner.animations[dir].filename = "__RsMiningDrills__/graphics/entity/".. item_name .."/".. item_data.based_on.."-"..short..".png"
      miner.animations[dir].hr_version.filename = "__RsMiningDrills__/graphics/entity/".. item_name .."/hr-".. item_data.based_on.."-"..short..".png"
      miner.input_fluid_patch_sprites[dir].filename =  "__RsMiningDrills__/graphics/entity/".. item_name .."/".. item_data.based_on.."-"..short.."-patch.png"
      miner.input_fluid_patch_sprites[dir].hr_version.filename =  "__RsMiningDrills__/graphics/entity/".. item_name .."/hr-".. item_data.based_on.."-"..short.."-patch.png"
    end
    miner.energy_source.emissions_per_minute=20*item_data.mining_speed
  else
    -- made this with the though of maybe having them work with heat pipes. Then realised that's not really medieval like. Still made the last two mining tiers 4x4
    for dir, short in pairs({north="N", east="E", south="S", west="W"}) do
      miner.animations[dir].animation_speed = item_data.mining_speed
      miner.animations[dir].hr_version.animation_speed = item_data.mining_speed
      miner.animations[dir].filename = "__RsMiningDrills__/graphics/entity/".. item_name .."/".. item_data.based_on.."-"..short..".png"
      miner.animations[dir].hr_version.filename = "__RsMiningDrills__/graphics/entity/".. item_name .."/hr-".. item_data.based_on.."-"..short..".png"

      miner.input_fluid_patch_sprites[dir].filename =  "__RsMiningDrills__/graphics/entity/".. item_name .."/".. item_data.based_on.."-"..short.."-patch.png"
      miner.input_fluid_patch_sprites[dir].hr_version.filename =  "__RsMiningDrills__/graphics/entity/".. item_name .."/hr-".. item_data.based_on.."-"..short.."-patch.png"
    end
    miner.energy_source.emissions_per_minute=8*item_data.mining_speed
  end
  miner.localised_name = {"item-name."..item_name}
  data.raw["mining-drill"][item_name] = nil
  data:extend({miner})
end

