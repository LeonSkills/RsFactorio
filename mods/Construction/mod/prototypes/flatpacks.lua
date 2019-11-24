require("__RsBase__/scripts/prototypes")
require("__RsBase__/scripts/utility")

local entity_colours = require("__RsConstruction__/data/entity_colours")



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


local function create_recipe_duplicate(item, enabled, hidden)
  local recipe =  {
    type = "recipe",
    name = item.name.."-unpack",
    subgroup = item.subgroup.."-construction-unpack",
    order = item.order,
    ingredients = {{item.name, 1}},
    result = item.name..'-entity',
    result_count = 1,
    energy_required = 0.01,
    enabled = enabled,
    hidden = hidden
  }
  return recipe
end

local function create_invert_recipe(item, enabled, hidden)
  local recipe = {
    type = "recipe",
    name = item.name.."-pack",
    subgroup = item.subgroup.."-construction-pack",
    order = item.order,
    ingredients = {{item.name..'-entity', 1}},
    result = item.name,
    result_count = 1,
    energy_required = 0.01,
    enabled = enabled,
    hidden = hidden
  }
  return recipe
end

local function create_flatpack_recipes(item, recipe)
  local enabled = recipe == nil
  if recipe then
    if recipe.enabled == false then
      enabled = false
    elseif recipe.normal and recipe.normal.enabled == false then
      enabled = false
    elseif recipe.expensive and recipe.expensive == false then
      enabled = false
    else
      enabled = true
    end

  end
  local hidden = false
  if item.flags then
    hidden = contains(item.flags, "hidden")
  end
  if recipe and recipe.hidden ~= nil then
    hidden = recipe.hidden
  end
  local recipe_duplicate = create_recipe_duplicate(item, enabled, hidden)
  local recipe_invert = create_invert_recipe(item, enabled, hidden)
  if not data.raw["item-subgroup"][recipe_duplicate.subgroup] then
    create_subgroup(item)
  end
  return recipe_duplicate, recipe_invert
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
  item_duplicate.subgroup = item.subgroup.."-construction-unpack"
  if not data.raw["item-subgroup"][item_duplicate.subgroup] then
    create_subgroup(item)
  end
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

local function change_item_properties(item, item_duplicate, entity)
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
  if entity then
    print(entity.name, entity.type)
    tprint(entity_colours[entity.type])
    table.insert(item.icons, 2,{
      icon = "__RsConstruction__/graphics/icons/flatpack_colour.png",
      icon_size = 64,
      tint = (entity and entity_colours[entity.type]) or {10, 22, 243}
    })
  end
  if item.icon then
    table.insert(item.icons, {
      icon = item.icon,
      icon_size = item.icon_size,
      scale = 0.5,
    })
    item.icon = nil
  end
end

local entity_items = {}
local items = {}
local recipes = {}

for name, item in pairs(data.raw.item) do
  if item.place_result then
    local entity = get_minable_entity(item.place_result)
    if entity == nil or (entity.type ~= "construction-robot" and entity.type ~= "logistic-robot") then
      local recipe = data.raw.recipe[item.name]
      local item_duplicate = create_item_duplicate(item, entity)
      local recipe1, recipe2 = create_flatpack_recipes(item, recipe)
      table.insert(items, item_duplicate)
      table.insert(recipes, recipe1)
      table.insert(recipes, recipe2)
      change_entity_mineable(entity, item, name, item_duplicate)
      change_item_properties(item, item_duplicate, entity)
      entity_items[name] = true
    end
  end
end

local function create_flatpack_technology(item, technology)
  local prototype = data.raw.technology[technology.name.."-flatpacks"]
  if not prototype then
    prototype = get_prototype(technology.name.."-flatpacks", "technology")
    prototype.prerequisites = {technology.name}
    prototype.icons = technology.icons
    prototype.icon = technology.icon
    prototype.icon_size = technology.icon_size
    prototype.enabled = technology.enabled
    prototype.upgrade = technology.upgrade
    prototype.hidden = technology.hidden
    prototype.max_level = technology.max_level
    prototype.unit = technology.unit
    prototype.localised_name = {"item-name.flatpack", technology.localised_name or {"technology-name."..technology.name}}
    prototype.localised_description = {"technology-description.flatpack", technology.localised_name or {"technology-name."..technology.name}}
  end
  table.insert(prototype.effects, {type="unlock-recipe", recipe=item.."-pack"})
  table.insert(prototype.effects, {type="unlock-recipe", recipe=item.."-unpack"})
  --prototype.unit.ingredients = {}
end

-- update technologies
for name, technology in pairs(data.raw.technology) do
  if technology.effects then
    local already_inserted = {}
    for _, effect in pairs(technology.effects) do
      if effect.type == "unlock-recipe" then
        local recipe = data.raw.recipe[effect.recipe]
        if recipe then
          for k, mode in pairs({recipe, recipe.normal, recipe.expensive}) do
            if mode then
              local results = mode.results or {{name=mode.result}}
              for z, product in pairs(results) do
                local item_name = product.name or product[1]
                if entity_items[item_name] and not already_inserted[item_name]then
                  already_inserted[item_name] = true
                  create_flatpack_technology(item_name, technology)
                end
              end
            end
          end
        end
      end
    end
  end
end

data:extend(items)
data:extend(recipes)