require("__RsBase__/scripts/prototypes")
require("__RsBase__/scripts/utility")


local items = {}
local recipes = {}

local function create_subgroup(item)
  local item_subgroup = data.raw["item-subgroup"][item.subgroup]
    local item_group = data.raw["item-group"][item_subgroup.group]
    data:extend({
      {
      type = "item-subgroup",
      name = item.subgroup.."-construction-unpack",
      group = "rs-construction",
      order = "flatpack-a-"..item_group.order or "0".."-"..item_subgroup.order or "0".."flatpack-b"
      },
      {
      type = "item-subgroup",
      name = item.subgroup.."-construction-pack",
      group = "rs-construction-flatpack",
      order = "flatpack-a-"..item_group.order or "0".."-"..item_subgroup.order or "0".."flatpack-a"
      }
    })
end


local function create_recipe_duplicate(item)
  local recipe =  {
    type = "recipe",
    name = item.name.."-unpack",
    subgroup = item.subgroup.."-construction-unpack",
    order = item.order,
    ingredients = {{item.name, 1}},
    result = item.name..'-entity',
    result_count = 1,
    energy_required = 0.01,
    enabled = item.enabled or true,  -- todo
    hidden = item.flags and contains(item.flags, "hidden")
  }
  if not data.raw["item-subgroup"][recipe.subgroup] then
    create_subgroup(item)
  end
  return recipe
end

local function create_invert_recipe(item)
  local recipe = {
    type = "recipe",
    name = item.name.."-pack",
    subgroup = item.subgroup.."-construction-pack",
    order = item.order,
    ingredients = {{item.name..'-entity', 1}},
    result = item.name,
    result_count = 1,
    energy_required = 0.01,
    enabled = item.enabled or true,  -- todo
    hidden = item.flags and contains(item.flags, "hidden")
  }
  if not data.raw["item-subgroup"][recipe.subgroup] then
    create_subgroup(item)
  end
  return recipe
end

local function create_item_duplicate(item, entity)
  local item_duplicate = table.deepcopy(item)
  item_duplicate.name = item.name.."-entity"
  item_duplicate.order = item.order.."-b"
  item_duplicate.localised_name = item.localised_name or {"entity-name."..item.name}
  item_duplicate.localised_description = item.localised_description or
      (entity and entity.localised_description) or {"entity-description."..item.name}
  item_duplicate.stackable = false
  item_duplicate.stack_size = 1
  return item_duplicate
end

local function change_entity_mineable(entity, item, name, item_duplicate)
    if entity and entity.minable then
    if entity.minable.result == item.name then
      entity.minable.result = item_duplicate.name
    end
    if entity.minable.results then
      for _, r in pairs(entity.minable.results) do
        if r.name == name then
          r.name = item_duplicate.name
        end
        if r[1] == name then
          r[1] = item_duplicate.name
        end
      end
    end
  end
end

local function change_item_properties(item, item_duplicate)
  item.place_result = nil
  item.icons = item.icons or {}
  for k, v in pairs(item.icons) do
    v.scale = v.scale and v.scale/2 or 1/2
  end
  item.localised_name = {"item-name.flatpack", item_duplicate.localised_name}
  item.localised_description = {"item-description.flatpack", item_duplicate.localised_name}
  table.insert(item.icons, 1,{
    icon = "__RsConstruction__/graphics/icons/flatpack.png",
    icon_size = 64
  })
  if item.icon then
    table.insert(item.icons, {
      icon = item.icon,
      icon_size = item.icon_size,
      scale = 0.5
    })
    item.icon = nil
  end
end

for name, item in pairs(data.raw.item) do
  if item.place_result then
    local entity = get_minable_entity(item.place_result)
    if entity == nil or (entity.type ~= "construction-robot" and entity.type ~= "logistic-robot") then
      local item_duplicate = create_item_duplicate(item, entity)
      local recipe_duplicate = create_recipe_duplicate(item)
      local recipe_invert = create_invert_recipe(item)
      table.insert(items, item_duplicate)
      table.insert(recipes, recipe_duplicate)
      table.insert(recipes, recipe_invert)
      change_entity_mineable(entity, item, name, item_duplicate)
      change_item_properties(item, item_duplicate)
    end
  end
end

data:extend(items)
data:extend(recipes)