require("__RsUtility__.scripts.prototypes")

local item = {
  name = "rs-anvil",
  subgroup = "rs-smithing-assembling-machine",
  order = "010-anvil",
  stack_size = 50,
  icon = "__RsSmithing__/graphics/icons/anvil.png",
  icon_size = 32
}
create_item(item, true)

local recipe = {
  name = item.name,
  ingredients = {
    {
      "rs-iron-bar", 20
    }
  },
  results = {
    {
      "rs-anvil", 1
    }
  },
  energy_required = 1,
  enabled = false
}
create_recipe(recipe)

table.insert(data.raw.technology["automation"].effects, {type = "unlock-recipe", recipe = item.name})

local anvil = get_prototype(item.name, "furnace")

anvil.allowed_effects = {
      "consumption",
      "speed",
      "productivity",
      "pollution"
    }
anvil.result_inventory_size = 1
anvil.source_inventory_size = 1
anvil.energy_usage = "1W"
anvil.crafting_speed = 1
anvil.crafting_categories = { "rs-smithing"}
anvil.energy_source = {
  type = "void"
}
anvil.animation = {
  layers = {
    {
      width = 184,
      height = 184,
      frame_count = 1,
      filename = "__RsSmithing__/graphics/entity/anvil/anvil.png",
      scale = 0.25,
      hr_version = {
        width = 184,
        height = 184,
        frame_count = 1,
        filename = "__RsSmithing__/graphics/entity/anvil/anvil.png",
        scale = 0.25
      }
    }
  }
}
anvil.max_health = 400
anvil.corpse = "medium-remnants"
anvil.flags = {
  "placeable-player",
  "placeable-neutral",
  "player-creation"
}
anvil.order = item.order
anvil.icon = item.icon
anvil.icon_size = item.icon_size
anvil.collision_box = { { -0.7, -0.7}, { 0.7, 0.7}}
anvil.selection_box = { { -1, -1}, { 1, 1}}
anvil.minable = {
  mining_time = 0.3,
  result = item.name,
}
anvil.subgroup = item.subgroup
anvil.working_sound = {
  apparent_volume = 1,
  sound = {
    {
      filename = "__RsSmithing__/sound/anvil.ogg",
      volume = 1.8
    }
  }
}
anvil.vehicle_impact_sound = {
  filename = "__base__/sound/car-metal-impact.ogg",
  volume = 0.65
}
anvil.open_sound = {
  filename = "__base__/sound/machine-open.ogg",
  volume = 0.85
}
anvil.close_sound = {
  filename = "__base__/sound/machine-close.ogg",
  volume = 0.75
}
anvil.fast_replaceable_group = "rs-anvil"