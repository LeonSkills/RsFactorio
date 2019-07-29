require("__RsUtility__.scripts.prototypes")
require("__RsUtility__.scripts.utility")
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

for tree_level, tree_data in pairs(trees) do
  if tree_level > 1 then
    create_item({
      name = "rs-"..tree_data.name.."-tree-patch",
      order = "rs-002-tree-patch-" .. add_leading_zeros(tree_level, 3) .. "-" .. tree_data.name .. "002-cutting",
      subgroup = "rs-farming-patch",
      stack_size = 10,
      icon = "__RsFarming__/graphics/icons/"..tree_data.name.."-tree-patch.png",
      icon_size = 32
    }, true)
    create_recipe({
      name = "rs-"..tree_data.name.."-tree-patch",
      ingredients = {
        { "rs-farming-patch", 1 },
        { "rs-"..tree_data.name .. "-seed", 1 }
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
    patch.minable = {
      mining_time = 0.3,
      result = "rs-"..tree_data.name.."-tree-patch",
    }
    patch.subgroup = "rs-farming-patch"
    patch.order ="rs-002-tree-patch-"..add_leading_zeros(tree_level, 3).."-"..tree_data.name.."-002-cutting"
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