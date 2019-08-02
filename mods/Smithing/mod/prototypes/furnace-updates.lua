require("__RsBase__.scripts.utility")

-- We need to update the furnaces from furnace type to assembler type, so they can accept multiple ores


for item_name, item_data in pairs(data.raw.furnace) do
  if contains(item_data.crafting_categories, "smelting") then
    local smelter_furnace = table.deepcopy(item_data)
    local smelter_item = data.raw.item[smelter_furnace.name]
    local smelter_recipe = data.raw.recipe[smelter_furnace.name]
    smelter_furnace.type = "assembling-machine"
    smelter_furnace.name = item_name
    smelter_furnace.ingredient_count = 11
    smelter_furnace.minable.result = item_name
    smelter_furnace.subgroup = "rs-smithing-assembling-machine"
    smelter_furnace.order = "rs-020-".. (smelter_furnace.order or smelter_item.order or smelter_recipe.order)
    data.raw.furnace[item_name] = nil
    data:extend({ smelter_furnace })
    smelter_item.order = smelter_furnace.order
    smelter_item.subgroup = smelter_furnace.subgroup
    smelter_recipe.order = smelter_furnace.order
    smelter_recipe.subgroup = smelter_furnace.subgroup
  end
end

-- add dummy furnace if furnace list is empty since apparently at least one is needed
if #data.raw.furnace == 0 then
  local dummy_furnace = {
    type = "furnace",
    name = "dummy-furnace-rs",
    result_inventory_size = 1,
    source_inventory_size = 1,
    crafting_categories = {"smelting"},
    flags = {"hidden"},
    energy_usage = "1YW", -- Don't even think of using this furnace
    crafting_speed = 0.0001,
    energy_source = {
      type = "void" -- right, that makes the 1YW void..
    },
    animation = nil,
    idle_animation = nil

  }
  data:extend({ dummy_furnace})
end