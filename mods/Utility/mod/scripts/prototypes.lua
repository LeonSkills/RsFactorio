local vanilla_conversions = require("__RsUtility__.data.vanilla_names")
local science_packs = require("__RsUtility__.data.science_packs")
require("utility")

function get_vanilla_name(string)
  return vanilla_conversions[string] or string
end

function get_science_pack(string)
  return get_vanilla_name(science_packs[string])
end

function get_prototype(name, prototype)

  name = get_vanilla_name(name)

  if not data.raw[prototype][name] then
    data:extend({
      {type = prototype, name = name}
    })
  end
  local proto = data.raw[prototype][name]
  if prototype == "recipe" then
    proto.ingredients = {}
    proto.normal = nil
    proto.expensive = nil
  elseif prototype == "technology" then
    proto.prerequisites = {}
    proto.effects = {}
  elseif prototype == "equipment-grid" then
    proto.equipment_categories = {}
  end
  return proto
end

function create_item(item, is_entity)
  item.localised_name = item.localised_name or { "item-name." .. item.name}
  item.localised_description = item.localised_description or { "item-description." .. item.name}
  item.name = get_vanilla_name(item.name)

  if contains(science_packs, item.name) then
    item.type = "tool"
    item.durability = item.durability or 1
    local lab = data.raw.lab["rs-burner-lab"]
    table.insert(lab.inputs, item.name)
  else
    item.type = "item"
  end

  if is_entity then
    item.place_result = item.name
  end

  local prototype = get_prototype(item.name, item.type)

  -- merge tables
  for k,v in pairs(item) do
    if v == "nil" then
      v = nil
    end
    prototype[k] = v
  end

  return prototype
end

function create_recipe(recipe)
  recipe.name = get_vanilla_name(recipe.name)
  for _, ingredients in pairs(recipe.ingredients) do
    if ingredients["name"] then
      ingredients["name"] = get_vanilla_name(ingredients["name"])
    else
      ingredients[1] = get_vanilla_name(ingredients[1])
    end
  end
  recipe.result = get_vanilla_name(recipe.result)
  for _, results in pairs(recipe.results) do
    if results["name"] then
      results["name"] = get_vanilla_name(results["name"])
    else
      results[1] = get_vanilla_name(results[1])
    end
  end
  local prototype = get_prototype(recipe.name, "recipe")
  -- merge tables
  for k,v in pairs(recipe) do
    if v == "nil" then
      v = nil
    end
    prototype[k] = v
  end
  return prototype
end

function create_technology(technology, overwrite_effects, overwrite_prereqs, level_including)
  --level including indicates whether the science packs of technology.level should be included

  overwrite_effects = overwrite_effects or false
  overwrite_prereqs = overwrite_prereqs or false
  technology.name = get_vanilla_name(technology.name)
  local prototype = get_prototype(technology.name, "technology")
  technology.recipes_to_unlock = technology.recipes_to_unlock or {}
  technology.extra_effects = technology.extra_effects or {}
  technology.extra_prerequisites = technology.extra_prerequisites or {}
  if overwrite_effects then
    prototype.effects = {}
  end
  if overwrite_prereqs then
    prototype.prerequisites = {}
  end
  for _, recipe in pairs(technology.recipes_to_unlock) do
    recipe = get_vanilla_name(recipe)
    local recipe_proto = data.raw.recipe[recipe]
    if not recipe_proto then
      error("Unknown recipe " .. recipe ..". Consider creating the technology after the recipe has been made.")
    end
    recipe_proto.enabled = false
    if recipe_proto.normal then
      recipe_proto.normal.enabled = false
    end
    if recipe_proto.expensive then
      recipe_proto.expensive.enabled = false
    end
    table.insert(prototype.effects ,{ type = "unlock-recipe", recipe=recipe})
  end
  for _, effect in pairs(technology.extra_effects) do
    table.insert(prototype.effects, effect)
  end
  for _, prerequisite in pairs(technology.extra_prerequisites) do
    table.insert(prototype.prerequisites, get_vanilla_name(prerequisite))
  end

  technology.unit.ingredients = {}
  local level_offset = level_including and 0 or 1
  for skill, levels in pairs(technology.levels) do
    local highest_pack
    if type(levels) ~= "table" then
      levels = {0, levels}
    end
    assert(#levels == 2)
    for i=levels[1], levels[2] -level_offset, 1 do
      local science_pack = science_packs[skill .. "-" .. i]
      if science_pack then
        science_pack = get_vanilla_name(science_pack)
        table.insert(technology.unit.ingredients, {science_pack, 1})
        if data.raw.technology[science_pack] then
          highest_pack = science_pack
        end
      end
    end
    if highest_pack then
      table.insert(prototype.prerequisites, highest_pack)
    end
  end

    -- merge tables
  for k,v in pairs(technology) do
    if v == "nil" then
      v = nil
    end
    prototype[k] = v
  end

  return prototype

end
--function create_prototype(params)
----function create_prototype(name, order, subgroup, stack_size, ingredients, energy_required, localised_name, localised_description, category, technology, hidden, is_entity, result_count)
--
--  local mod_name = params.mod_name
--  local name = params.name
--  local order = params.order
--  local subgroup = params.subgroup
--  local item_params = params.item_params
--  local recipe_params = params.recipe_params
--  local localised_name = params.localised_name
--  local localised_description = params.localised_description
--  local technology = params.technology
--
--  local item = get_prototype(name, "item")
--  if params.create_icon ~= false then -- When we want to keep the old icon
--    item.icon = params.icon or "__"..mod_name.."__/graphics/icons/"..name..".png"
--    item.icon_size = 32
--  end
--  item.order = order
--  item.subgroup = subgroup
--  item.localised_name = localised_name
--  item.localised_description = localised_description
--  item.stack_size = item_params.stack_size
--  if item.flags then
--    for i, flag in pairs(item.flags) do
--      if flag == "hidden" then
--        item.flags[i] = nil
--      end
--    end
--  end
--  if item_params.is_entity then
--    data.raw.item[name].place_result = name
--  end
--  if item_params.hidden then
--    data.raw.item[name].flags = {"hidden"}
--  else
--    data.raw.item[name].flags = {}
--  end
--
--  if recipe_params.allow_decomposition == nil then
--    recipe_params.allow_decomposition = true
--  end
--
--  local recipe = get_prototype(name, "recipe")
--  recipe.icon = item.icon
--  recipe.icon_size = 32
--  recipe.order = order
--  recipe.subgroup = subgroup
--  recipe.localised_name = localised_name
--  recipe.localised_description = localised_description
--  recipe.category = recipe_params.category
--  if recipe_params.overwrite_ingredients then
--    recipe.normal = nil
--    recipe.expensive = nil
--    recipe.ingredients = recipe_params.ingredients
--    recipe.result = nil
--    recipe.result_amount = 0
--    recipe.results = recipe_params.results or {{name, 1}}
--    recipe.energy_required = recipe_params.energy_required
--    recipe.always_show_made_in = true
--    recipe.enabled = technology == nil or data.raw.technology[technology] == nil
--    recipe.hidden = recipe_params.hidden
--    recipe.allow_decomposition = recipe_params.allow_decomposition
--  else
--    -- we still overwrite normal/expensive mode
--    recipe.normal = nil
--    recipe.expensive = nil
--    extend_table(recipe.ingredients, recipe_params.ingredients)
--    recipe.result = nil
--    recipe.result_amount = 0
--    recipe.results = recipe_params.results or {{name, 1}}
--    recipe.energy_required = recipe_params.energy_required
--    recipe.always_show_made_in = true
--    recipe.enabled = technology == nil or data.raw.technology[technology] == nil
--    recipe.hidden = recipe_params.hidden
--    recipe.allow_decomposition = recipe_params.allow_decomposition
--  end
--  if technology and data.raw.technology[technology]  then
--    -- assumes technology is already created
--    if not data.raw.technology[technology].effects then
--      data.raw.technology[technology].effects = {}
--    end
--    table.insert(data.raw.technology[technology].effects, {type="unlock-recipe", recipe=name})
--  end
--end
