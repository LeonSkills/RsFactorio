require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")
local trees = require("data.patch_data")


-- empty patch item
create_item({
  name = "rs-farming-patch",
  order = "rs-001-farming-patch",
  subgroup = "rs-farming-patch",
  stack_size = 10,
  icon = "__RsFarming__/graphics/icons/farming-patch.png",
  icon_size = 32
})

create_recipe({
  name = "rs-farming-patch",
  main_product = "rs-farming-patch",
  results = {
    {"rs-farming-patch", 1},
    {name = "rs-bucket", amount = 5, catalyst_amount = 5}
  },
  ingredients = {
    {"rs-plank", 5},
    {"rs-bronze-nails", 5},
    {name = "rs-compost", amount = 5, catalyst_amount = 5},
  },
  energy_required = 1,
  category = "crafting",
  allow_decomposition = false
})

-- trees
for tree_level, tree_data in pairs(trees) do
  if tree_level > 1 then
    create_item({
      name = "rs-"..tree_data.name.."-tree-patch",
      order = "rs-080-tree-patch-" .. add_leading_zeros(tree_level, 3) .. "-" .. tree_data.name .. "002-cutting",
      subgroup = "rs-farming-patch",
      stack_size = 10,
      icon = "__RsFarming__/graphics/icons/"..tree_data.name.."-tree-patch.png",
      icon_size = 32
    }, true)
    create_recipe({
      name = "rs-"..tree_data.name.."-tree-patch",
      ingredients = {
        {"rs-farming-patch", 1},
        {"rs-"..tree_data.name .. "-seed", 1}
      },
      results = {
        {"rs-"..tree_data.name.."-tree-patch", 1}
      },
      energy_required = tree_level * 0.6,
      category =  "crafting"
    })

    local patch = get_prototype("rs-"..tree_data.name.."-tree-patch", "assembling-machine")
    patch.allowed_effects = {
      "consumption",
      "speed",
      "productivity"
    }
    patch.module_specification = {
      module_slots = 2,
    }
    patch.localised_name = {"item-name.rs-"..tree_data.name.."-tree-patch"}
    patch.result_inventory_size = 1
    patch.source_inventory_size = 1
    patch.energy_usage = "1W"
    patch.crafting_speed = 1
    patch.crafting_categories = {"rs-"..tree_data.name.."-farming"}
    patch.energy_source = { -- Todo, water
      type = "void"
    }
    patch.animation = {
      layers = {
        {
          width = tree_data.width,
          height = tree_data.height,
          frame_count = tree_data.growth_stages,
          animation_speed = tree_data.growth_stages/tree_data.mining_time/30,
          priority = "high",
          filename = "__RsFarming__/graphics/entity/"..tree_data.name.."-tree-patch/"..tree_data.name.."-tree.png",
          scale = 0.5*157/175,
          shift = tree_data.shift,
          hr_version = {
            width = tree_data.width,
            height = tree_data.height,
            frame_count = tree_data.growth_stages,
            animation_speed = tree_data.growth_stages/tree_data.mining_time/30,
            priority = "high",
            filename = "__RsFarming__/graphics/entity/"..tree_data.name.."-tree-patch/"..tree_data.name.."-tree.png",
            scale = 0.5*157/175,
            shift = tree_data.shift,
          }
        }
      }
    }
    patch.idle_animation = {
      layers = {
        {
          width = tree_data.width,
          height = tree_data.height,
          frame_count = tree_data.growth_stages,
          filename = "__RsFarming__/graphics/entity/"..tree_data.name.."-tree-patch/"..tree_data.name.."-stump.png",
          scale = 0.5*157/175,
          shift = tree_data.shift,
          hr_version = {
            width = tree_data.width,
            height = tree_data.height,
            frame_count = tree_data.growth_stages,
            filename = "__RsFarming__/graphics/entity/"..tree_data.name.."-tree-patch/"..tree_data.name.."-stump.png",
            scale = 0.5*157/175,
            shift = tree_data.shift,
          }
        }
      }
    }
    patch.max_health = 400
    patch.corpse = "medium-remnants"
    patch.flags = {
      "placeable-player",
      "placeable-neutral",
      "player-creation"
    }
    patch.icon = "__RsFarming__/graphics/icons/"..tree_data.name.."-tree-patch.png"
    patch.icon_size = 32
    patch.collision_box = {{-1.2,-1.2}, {1.2, 1.2}}
    patch.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
    patch.drawing_box = {{-2, -1.5}, {2, 4}}
    patch.minable = {
      mining_time = 0.3,
      result = "rs-"..tree_data.name.."-tree-patch",
    }
    patch.subgroup = "rs-farming-patch"
    patch.order ="rs-090-tree-patch-"..add_leading_zeros(tree_level, 3).."-"..tree_data.name.."-002-cutting"
    patch.working_sound = {
      apparent_volume = 1,
      sound = {
        {
          filename = "__RsFarming__/sound/cut-wood.ogg",
          volume = 3.8
        }
      }
    }
    patch.vehicle_impact_sound = {
      filename = "__base__/sound/car-wood-impact.ogg",
      volume = 0.65
    }
    patch.open_sound = {
      filename = "__base__/sound/machine-open.ogg",
      volume = 0.85
    }
    patch.close_sound = {
      filename = "__base__/sound/machine-close.ogg",
      volume = 0.75
    }
    patch.fast_replaceable_group = "farming-patch"
  end
end

--herb patch
local herb_patch_item = create_item({
  name = "rs-herb-farming-patch",
  subgroup = "rs-farming-patch",
  order = "rs-010-herb-farming-patch",
  stack_size = 10,
  icons = {
    {
      icon = "__RsFarming__/graphics/icons/farming-patch.png",
      icon_size = 32,
    },
    {
      icon = "__RsFarming__/graphics/icons/auto_generated/clean_guam.png",
      icon_size = 32,
      scale = 0.5
    }
  },
  icon_size = 32
}, true)

create_recipe({
  name = "rs-herb-farming-patch",
  ingredients = {
    {"rs-farming-patch", 1},
    {"rs-guam-seed", 1}
  },
  results = {
    {"rs-herb-farming-patch", 1}
  },
  energy_required = 1.2,
  category =  "crafting"
})

local patch = get_prototype("rs-herb-farming-patch", "assembling-machine")
patch.allowed_effects = {
  "consumption",
  "speed",
  "productivity"
}
patch.module_specification = {
  module_slots = 2,
}
patch.localised_name = {"item-name.rs-herb-farming-patch"}
patch.result_inventory_size = 1
patch.source_inventory_size = 1
patch.energy_usage = "1W"
patch.crafting_speed = 1
patch.crafting_categories = {"rs-herb-farming"}
patch.energy_source = { -- Todo, water
  type = "void"
}
local frame_count = 5
local animation_duration = 12 -- in seconds
local tile_size = 2
patch.animation = {
  layers = {{
      width = 256,
      height = 256,
      frame_count = 1,
      animation_speed = frame_count/(animation_duration * 30), -- 30 is a magic number?
      priority = "high",
      filename = "__RsFarming__/graphics/entity/farming-patch/farming-patch.png",
      scale = 0.5*157/175/3 * tile_size,
      repeat_count = frame_count
      --shift = tree_data.shift,
    },

  }
}
patch.idle_animation = {
  layers = {
    {
      width = 256,
      height = 256,
      frame_count = 1,
      animation_speed = 1,
      priority = "high",
      filename = "__RsFarming__/graphics/entity/farming-patch/farming-patch.png",
      scale = 0.5*157/175/3 * tile_size,
      repeat_count = frame_count
      --shift = tree_data.shift,
    }
  }
}
patch.working_visualisations = {
  {
    animation = {
      width = 300,
      height = 300,
      frame_count = frame_count,
      animation_speed = frame_count/(animation_duration * 30), -- 30 is a magic number?
      priority = "high",
      filename = "__RsFarming__/graphics/entity/herb-farming-patch/herb_stages_tint.png",
      scale = 0.25/3 * tile_size,
      line_length = frame_count
      --shift = tree_data.shift,
    },
    apply_recipe_tint = "primary"
  }
}
patch.default_recipe_tint = {primary = {102, 229, 56}}
patch.max_health = 400
patch.corpse = "medium-remnants"
patch.flags = {
  "placeable-player",
  "placeable-neutral",
  "player-creation"
}
patch.icons = herb_patch_item.icons
patch.icon_size = 32
patch.collision_box = {{-tile_size/2 + 0.3,-tile_size/2 + 0.3}, {tile_size/2 - 0.3, tile_size/2 - 0.3}}
patch.selection_box = {{-tile_size/2, -tile_size/2}, {tile_size/2, tile_size/2}}
patch.minable = {
  mining_time = 0.3,
  result = "rs-herb-farming-patch",
}
patch.subgroup = "rs-farming-patch"
patch.order ="rs-010-herb-farming"
patch.vehicle_impact_sound = {
  filename = "__base__/sound/car-wood-impact.ogg",
  volume = 0.65
}
patch.open_sound = {
  filename = "__base__/sound/machine-open.ogg",
  volume = 0.85
}
patch.close_sound = {
  filename = "__base__/sound/machine-close.ogg",
  volume = 0.75
}
patch.fast_replaceable_group = "farming-patch"
patch.scale_entity_info_icon = true
patch.entity_info_icon_shift = {0, tile_size/2 - 0.25}