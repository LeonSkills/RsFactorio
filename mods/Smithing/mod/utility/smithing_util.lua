require("__RsBase__.scripts.prototypes")


function make_smithable(prototype_name, technology)
  prototype_name = get_vanilla_name(prototype_name)
  technology = get_vanilla_name(technology)
  local item = data.raw.item[prototype_name]
  local recipe = data.raw.recipe[prototype_name]
  if item == nil or recipe == nil then
    print("Tried to make a non existing prototypes ("..prototype_name..") smithable")
    return
  end
  local localised_name = item.localised_name
  if localised_name == nil then
    localised_name = {"item-name."..prototype_name}
  end

  local unfinished_recipe_icon = {
    {
      icon = item.icon,
      scale = 32/item.icon_size,
      icon_size = 32
    },
    {
      icon = "__RsSmithing__/graphics/icons/unfinished-smithing-item.png",
      scale = 0.5,
      shift = {-8, 8}
    }
  }

  data:extend({
    {
      type = "item",
      name = "rs-unfinished-"..prototype_name,
      icon = "__RsSmithing__/graphics/icons/unfinished-smithing-item.png",
      icon_size = 32,
      order = item.order.."-a",
      stack_size = item.stack_size,
      subgroup = item.subgroup,
      localised_name = {"smithing.unfinished", localised_name},
      localised_description = {"smithing.unfinished-description"},
    },
    {
      type = "recipe",
      name = "rs-unfinished-"..prototype_name,
      icons = unfinished_recipe_icon,
      icon_size = 32,
      order = (recipe.order or item.order).."-a",
      subgroup = recipe.subgroup,
      localised_name = {"smithing.unfinished", localised_name},
      localised_description = {"smithing.unfinished-description"},
      result = "rs-unfinished-"..prototype_name,
      ingredients = recipe.ingredients,
      energy_required = 0.6,
      category = "smelting",
      hide_from_stats=true,
      always_show_made_in = true,
      enabled = technology == nil or data.raw.technology[technology] == nil
    }
  })
  recipe.ingredients = {{"rs-unfinished-"..prototype_name, 1}}
  recipe.category = "rs-smithing"
  recipe.order = (recipe.order or item.order).."-b"
  recipe.always_show_made_in = true
  item.order = item.order.."-b"
  if technology and data.raw.technology[technology] then
    -- assumes technology is already created
    local effects = data.raw.technology[technology].effects
    table.insert(effects, #effects, {type="unlock-recipe", recipe="rs-unfinished-"..prototype_name})
  end

end