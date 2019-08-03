-- belts, undergrounds, splitters and loaders
require("__RsBase__.scripts.utility")
local belts = require("data.belt-data")

local base_belt = data.raw["transport-belt"]["transport-belt"]
local base_underground = data.raw["underground-belt"]["underground-belt"]
local base_splitter = data.raw.splitter.splitter
local base_loader = data.raw.loader.loader

local to_add = {}

local base_belt_speed = 0.03125

for tier, item_data in pairs(belts) do
  local material = item_data.name
  local belt_name = get_vanilla_name("rs-"..material.."-transport-belt")
  local underground_name = get_vanilla_name("rs-"..material.."-underground-belt")
  local splitter_name = get_vanilla_name("rs-"..material.."-splitter")
  local loader_name = get_vanilla_name("rs-"..material.."-loader")

  local belt = table.deepcopy(base_belt)
  belt.name = belt_name
  belt.order = "rs-belts-001-belt-"..add_leading_zeros(tier, 3).."-"..belt_name
  belt.belt_animation_set = table.deepcopy(data.raw["transport-belt"][item_data.based_on.."transport-belt"].belt_animation_set)
  belt.belt_animation_set.animation_set.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/transport-belt.png"
  belt.belt_animation_set.animation_set.hr_version.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/hr-transport-belt.png"
  belt.icon = "__RsBelts__/graphics/icons/"..material.."-transport-belt.png"
  belt.minable.result = belt_name
  belt.speed = item_data.speed * base_belt_speed
  belt.localised_name = {"belts.transport-belt", {"material.rs-"..material.."-c"}}
  if item_data.next_upgrade ~= nil then
    belt.next_upgrade = get_vanilla_name("rs-"..item_data.next_upgrade.."-transport-belt")
  else
    belt.next_upgrade = nil
  end
  table.insert(to_add, belt)

  local underground = table.deepcopy(base_underground)
  underground.name = underground_name
  underground.order = "rs-belts-002-underground-"..add_leading_zeros(tier, 3).."-".. underground_name
  underground.belt_animation_set = table.deepcopy(data.raw["underground-belt"][item_data.based_on.."underground-belt"].belt_animation_set)
  underground.belt_animation_set.animation_set.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/transport-belt.png"
  underground.belt_animation_set.animation_set.hr_version.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/hr-transport-belt.png"
  underground.icon = "__RsBelts__/graphics/icons/".. material .."-underground-belt.png"
  underground.minable.result = underground_name
  underground.speed = item_data.speed * base_belt_speed
  underground.localised_name = {"belts.underground-belt", {"material.rs-"..material.."-c"}}
  if item_data.next_upgrade ~= nil then
    underground.next_upgrade = get_vanilla_name("rs-"..item_data.next_upgrade.."-underground-belt")
  else
    underground.next_upgrade = nil
  end
  underground.max_distance = item_data.distance
  underground.structure.direction_in.sheet.filename = "__RsBelts__/graphics/entity/".. material.. "-underground-belt/underground-belt-structure.png"
  underground.structure.direction_in.sheet.hr_version.filename = "__RsBelts__/graphics/entity/".. material.. "-underground-belt/hr-underground-belt-structure.png"
  underground.structure.direction_in_side_loading.sheet.filename = "__RsBelts__/graphics/entity/"..material.. "-underground-belt/underground-belt-structure.png"
  underground.structure.direction_in_side_loading.sheet.hr_version.filename = "__RsBelts__/graphics/entity/"..material.. "-underground-belt/hr-underground-belt-structure.png"
  underground.structure.direction_out.sheet.filename = "__RsBelts__/graphics/entity/"..material.. "-underground-belt/underground-belt-structure.png"
  underground.structure.direction_out.sheet.hr_version.filename = "__RsBelts__/graphics/entity/"..material.. "-underground-belt/hr-underground-belt-structure.png"
  underground.structure.direction_out_side_loading.sheet.filename = "__RsBelts__/graphics/entity/"..material.. "-underground-belt/underground-belt-structure.png"
  underground.structure.direction_out_side_loading.sheet.hr_version.filename = "__RsBelts__/graphics/entity/"..material.. "-underground-belt/hr-underground-belt-structure.png"
  table.insert(to_add, underground)

  local splitter = table.deepcopy(base_splitter)
  splitter.name = splitter_name
  splitter.order = "rs-belts-003-splitter-"..add_leading_zeros(tier, 3).."-".. splitter_name
  splitter.belt_animation_set = table.deepcopy(data.raw["splitter"][item_data.based_on.."splitter"].belt_animation_set)
  splitter.belt_animation_set.animation_set.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/transport-belt.png"
  splitter.belt_animation_set.animation_set.hr_version.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/hr-transport-belt.png"
  splitter.icon = "__RsBelts__/graphics/icons/".. material .."-splitter.png"
  splitter.minable.result = splitter_name
  splitter.speed = item_data.speed * base_belt_speed
  splitter.localised_name = {"belts.splitter", {"material.rs-"..material.."-c"}}
  if item_data.next_upgrade ~= nil then
    splitter.next_upgrade = get_vanilla_name("rs-"..item_data.next_upgrade.."-splitter")
  else
    splitter.next_upgrade = nil
  end
  for i, dir in pairs({"north", "east", "south", "west"}) do
    splitter.structure[dir].filename = "__RsBelts__/graphics/entity/".. material.."-splitter/splitter-"..dir..".png"
    splitter.structure[dir].hr_version.filename = "__RsBelts__/graphics/entity/".. material .."-splitter/hr-splitter-"..dir..".png"
  end
  table.insert(to_add, splitter)

  local loader = table.deepcopy(base_loader)
  loader.name = loader_name
  loader.order = "rs-belts-004-loader-"..add_leading_zeros(tier, 3).."-".. loader_name
  loader.speed = item_data.speed * base_belt_speed
  loader.localised_name = {"belts.loader", {"material."..material.."-c"}}
  if item_data.next_upgrade ~= nil then
    loader.next_upgrade = get_vanilla_name("rs-"..item_data.next_upgrade.."-loader")
  else
    loader.next_upgrade = nil
  end
  loader.minable.result = loader_name
  loader.icon = "__RsBelts__/graphics/icons/".. material .."-loader.png"
  loader.icon_size=32
  loader.belt_animation_set = table.deepcopy(data.raw["loader"][item_data.based_on.."loader"].belt_animation_set)
  loader.belt_animation_set.animation_set.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/transport-belt.png"
  loader.belt_animation_set.animation_set.hr_version.filename = "__RsBelts__/graphics/entity/"..material.."-transport-belt/hr-transport-belt.png"
  table.insert(to_add, loader)
end

for _, entity in pairs(to_add) do
  if data.raw[entity.type][entity.name] then
    data.raw[entity.type][entity.name] = nil
  end
  data:extend({entity})
end
