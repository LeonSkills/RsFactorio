
require("__RsBase__.scripts.prototypes")

local bin = get_prototype("rs-compost-bin", "assembling-machine")
bin.order = "rs-000-compost-bin"
bin.subgroup = "rs-compost"
bin.icon = "__RsFarming__/graphics/icons/compost-bin.png"
bin.icon_size = 32
bin.collision_box = {{-0.35,-0.35}, {0.35, 0.35}}
bin.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
bin.minable = {
  mining_time = 0.3,
  result = get_vanilla_name("rs-compost-bin"),
}
bin.localised_name = {"item-name.rs-compost-bin"}
bin.result_inventory_size = 2
bin.source_inventory_size = 2
bin.crafting_speed = 1
bin.energy_usage = "100kW"
bin.energy_source = {
  type = "burner",
  render_no_power_icon = false,
  fuel_inventory_size = 4,
  fuel_category = "rs-compost"
}
bin.allowed_effects = {
  "consumption",
  "speed",
  "pollution"
}
bin.module_specification = {
  module_slots = 1,
}
bin.crafting_categories = {"rs-compost"}
bin.animation = {
  layers = {
    {
      width = 81,
      height = 98,
      frame_count = 1,
      animation_speed = 1,
      filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin-closed.png",
      scale = 0.45,
      shift = {0, -0.2},
      hr_version = {
        width = 81,
        height = 98,
        frame_count = 1,
        animation_speed = 1,
        filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin-closed.png",
        scale = 0.45,
        shift = {0, -0.2},
      }
    },
    {
      width = 182,
      height = 145,
      frame_count = 1,
      animation_speed = 1,
      draw_as_shadow = true,
      filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin-closed-shadow.png",
      scale = 0.45,
      flags = {"shadow"},
      shift = {0.8, -0.6},
      hr_version = {
        width = 182,
        height = 145,
        frame_count = 1,
        animation_speed = 1,
        draw_as_shadow = true,
        filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin-closed-shadow.png",
        scale = 0.45,
        flags = {"shadow"},
        shift = {0.8, -0.6},
      }
    }
  }
}
bin.idle_animation = {
  layers = {
    {
      width = 81,
      height = 98,
      frame_count = 1,
      animation_speed = 1,
      filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin.png",
      scale = 0.45,
      shift = {0, -0.2},
      hr_version = {
        width = 81,
        height = 98,
        frame_count = 1,
        animation_speed = 1,
        filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin.png",
        scale = 0.45,
        shift = {0, -0.2},
      }
    },
    {
      width = 182,
      height = 145,
      frame_count = 1,
      animation_speed = 1,
      draw_as_shadow = true,
      filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin-shadow.png",
      scale = 0.45,
      flags = {"shadow"},
      shift = {0.8, -0.6},
      hr_version = {
        width = 182,
        height = 145,
        frame_count = 1,
        animation_speed = 1,
        draw_as_shadow = true,
        filename = "__RsFarming__/graphics/entity/compost-bin/compost-bin-shadow.png",
        scale = 0.45,
        flags = {"shadow"},
        shift = {0.8, -0.6},
      }
    }
  }
}
bin.max_health = 100
bin.corpse = "small-remnants"
bin.vehicle_impact_sound = {
  filename = "__base__/sound/car-wood-impact.ogg",
  volume = 1
}
bin.open_sound = {
  filename = "__base__/sound/machine-open.ogg",
  volume = 0.85
}
bin.close_sound = {
  filename = "__base__/sound/machine-close.ogg",
  volume = 0.75
}
bin.flags = {
  "placeable-neutral",
  "player-creation"
}