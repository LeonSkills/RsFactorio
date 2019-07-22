require("__RsUtility__.scripts.utility")

-- We need to update the furnaces from furnace type to assembler type, so they can accept multiple ores


for item_name, item_data in pairs(data.raw.furnace) do
  if contains(item_data.crafting_categories, "smelting") then
    local smelter_item = table.deepcopy(item_data)
    smelter_item.type = "assembling-machine"
    smelter_item.name = item_name
    smelter_item.ingredient_count = 11
    smelter_item.minable.result = item_name
    data.raw.furnace[item_name] = nil
    data:extend({ smelter_item })
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