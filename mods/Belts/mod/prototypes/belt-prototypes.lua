require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")
local belts = require("data.belt-data")

for tier, item_data in pairs(belts) do
  local material = item_data.name
  local belt_name = "rs-"..material.."-transport-belt"
  local underground_name = "rs-"..material.."-underground-belt"
  local splitter_name = "rs-"..material.."-splitter"
  local loader_name = "rs-"..material.."-loader"

  create_item({
    name = belt_name,
    order = "rs-belts-001-belt-" .. add_leading_zeros(tier, 3) .. "-" .. belt_name,
    subgroup = "rs-transport-belt",
    icon = "__RsBelts__/graphics/icons/"..material.."-transport-belt.png",
    icon_size = 32,
    stack_size = 100,
    localised_name = {"belts.transport-belt", {"material.Rs-"..material}}
  }, true)

  create_recipe({
    name = belt_name,
    ingredients = item_data.belt_ingredients,
    results = {{belt_name, item_data.belt_result_amount}},
    category = "crafting",
    energy_required = 0.6
  })


  create_item({
    name = underground_name,
    order = "rs-belts-002-underground-" .. add_leading_zeros(tier, 3) .. "-" .. underground_name,
    subgroup = "rs-underground-belt",
    icon = "__RsBelts__/graphics/icons/"..material.."-underground-belt.png",
    icon_size = 32,
    stack_size = 50,
    localised_name = {"belts.underground-belt", {"material.Rs-"..material}}
  }, true)

  create_recipe({
    name = underground_name,
    ingredients = item_data.underground_ingredients,
    results = {{underground_name, item_data.underground_result_amount}},
    category = "crafting",
    energy_required = 0.6 * tier
  })

  create_item({
    name = splitter_name,
    order = "rs-belts-003-splitter-"..add_leading_zeros(tier, 3).."-".. splitter_name,
    subgroup = "rs-splitter",
    icon = "__RsBelts__/graphics/icons/"..material.."-splitter.png",
    icon_size = 32,
    stack_size = 50,
    localised_name = {"belts.splitter", {"material.Rs-"..material}}
  }, true)

  create_recipe({
    name = splitter_name,
    ingredients = item_data.splitter_ingredients,
    results = {{splitter_name, item_data.splitter_result_amount}},
    category = "crafting",
    energy_required = 0.6 * tier + 0.6
  })

  create_item({
    name = loader_name,
    order = "rs-belts-004-loader-"..add_leading_zeros(tier, 3).."-".. loader_name,
    subgroup = "rs-loader",
    icon = "__RsBelts__/graphics/icons/"..material.."-loader.png",
    icon_size = 32,
    stack_size = 50,
    flags = {},
    localised_name = {"belts.loader", {"material.Rs-"..material}}
  }, true)

  create_recipe({
    name = loader_name,
    ingredients = item_data.loader_ingredients,
    results = {{loader_name, item_data.loader_result_amount}},
    category = "crafting",
    energy_required = 1.2 * tier * 3,
    enabled = false
  })
end
