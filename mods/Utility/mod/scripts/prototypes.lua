local vanilla_conversions = require("__RsUtility__.data.vanilla_names")

function get_vanilla_name(string)
  return vanilla_conversions[string] or string
end

function get_prototype(name, prototype)

  if not data.raw[prototype][name] then
    data:extend({
      {type = prototype, name = name}
    })
  end
  local proto = data.raw[prototype][name]
  if prototype == "recipe" then
    proto.ingredients = {}
  elseif prototype == "technology" then
    proto.prerequisites = {}
    proto.effects = {}
  elseif prototype == "equipment-grid" then
    proto.equipment_categories = {}
  end
  return proto
end

function create_item(table)
  table.localised_name = table.localised_name or {"item-name." .. table.name}
  table.localised_description = table.localised_description or {"item-description." .. table.name}
  table.name = get_vanilla_name(table.name)

  local prototype = get_prototype(table.name, "item")

  -- merge tables
  for k,v in pairs(table) do
    if v == "nil" then
      v = nil
    end
    prototype[k] = v
  end

  return prototype
end

function create_recipe(table)
  table.name = get_vanilla_name(table.name)
  for _, ingredients in pairs(table.ingredients) do
    if ingredients["name"] then
      ingredients["name"] = get_vanilla_name(ingredients["name"])
    else
      ingredients[1] = get_vanilla_name(ingredients[1])
    end
  end
  table.result = get_vanilla_name(table.result)
  for _, results in pairs(table.results) do
    if results["name"] then
      results["name"] = get_vanilla_name(results["name"])
    else
      results[1] = get_vanilla_name(results[1])
    end
  end
  local prototype = get_prototype(table.name, "recipe")
  -- merge tables
  for k,v in pairs(table) do
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
