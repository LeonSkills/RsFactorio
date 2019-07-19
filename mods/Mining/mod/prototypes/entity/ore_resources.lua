local ores = require("prototypes.entity.ore_data")
local resource_autoplace = require("resource-autoplace")
require("__RsUtility__.scripts.prototypes")


local function resource(resource_parameters, autoplace_parameters)

  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__base__/graphics/icons/" .. resource_parameters.name .. ".png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    -- autoplace = autoplace_settings(name, order, coverage),
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = resource_parameters.autoplace_name or resource_parameters.name,
      order = resource_parameters.order,
      base_density = autoplace_parameters.base_density,
      has_starting_area_placement = autoplace_parameters.starting_rq_factor_multiplier > 0,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      seed1 = autoplace_parameters.seed
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__base__/graphics/entity/" .. resource_parameters.name .. "/hr-" .. resource_parameters.name .. ".png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    map_color = resource_parameters.map_color
  }
end

for ore_name, ore_data in pairs(ores) do
  local factorio_name = get_vanilla_name("rs-"..ore_name)
  local res = resource(
    {
      name = factorio_name,
      autoplace_name = factorio_name,
      order = "b",
      map_color = ore_data.color
    },
    {
      base_density = ore_data.base_density,
      reqular_rq_factor_multiplier = ore_data.regular_multiplier,
      starting_rq_factor_multiplier = ore_data.starting_multiplier,
      seed = ore_data.seed
    }
  )
  res.localised_name = {"item-name.rs-".. ore_name }
  res.minable = {
    mining_particle = factorio_name .. "-particle",
    mining_time = ore_data.hardness/5 + 1,
    result = factorio_name
  }
  if ore_data.entity_mod ~= "base" then
    res.stages.sheet.filename = "__"..ore_data.entity_mod.."__/graphics/entity/".. ore_name .."/".. ore_name ..".png"
    res.stages.sheet.hr_version.filename = "__"..ore_data.entity_mod.."__/graphics/entity/".. ore_name .."/hr-".. ore_name ..".png"
  else
    res.stages.sheet.filename = "__"..ore_data.entity_mod.."__/graphics/entity/".. factorio_name .."/".. factorio_name ..".png"
    res.stages.sheet.hr_version.filename = "__"..ore_data.entity_mod.."__/graphics/entity/".. factorio_name .."/hr-".. factorio_name ..".png"
  end
  res.icon = data.raw.item[factorio_name].icon
  if ore_data.required_fluid then
    res.minable.required_fluid = ore_data.required_fluid
    res.minable.fluid_amount = ore_data.fluid_amount
  end
  data.raw.resource[factorio_name] = nil
  data:extend({
    res
  })
  data.raw["autoplace-control"][factorio_name] = nil
  data.raw["noise-layer"][factorio_name] = nil
  data:extend({
    {
      type = "autoplace-control",
      name = factorio_name,
      richness = true,
      category = "resource",
      order = "rs-autoplace-ore-"..ore_data.level.."-"..ore_name,
      localised_name = {"item-name.rs-".. ore_name},
    },
    {
      type = "noise-layer",
      name = factorio_name,
      localised_name = {"item-name.rs-".. ore_name},
      order = "rs-autoplace-ore-"..ore_data.level.."-"..ore_name,
    }
  })
end
