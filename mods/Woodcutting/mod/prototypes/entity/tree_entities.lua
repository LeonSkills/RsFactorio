require("__RsUtility__.scripts.utility")
require("__RsUtility__.scripts.prototypes")

local trees = require("data.log_data")

for item_level, item_data in pairs(trees) do
  if item_level > 1 then
    local factorio_name = get_vanilla_name("rs-"..item_data.name.."tree")
    local corpse_name = get_vanilla_name("rs-"..item_data.name.."tree-corpse")
    data:extend({
      {
        type = "tree",
        name = factorio_name,
        emissions_per_second = -0.0001*item_level * item_level,
        collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
        selection_box = {{-1.5, -4.5}, {1.5, 1.3}},
        subgroup = "trees",
        vehicle_impact_sound = {
          filename = "__base__/sound/car-wood-impact.ogg",
          volume = 1
        },
        max_health = 20 * item_level * item_level,
        flags = {
          "placeable-neutral",
          "placeable-off-grid",
          "breaths-air"
        },
        minable = {
          mining_time = item_data.mining_time,
          results = {{name = get_vanilla_name("rs-"..item_data.name.."logs"), amount_min = item_data.amount_min, amount_max = item_data.amount_max}},
          mining_particle = "wooden-particle"
        },
        remains_when_mined = corpse_name,
        icon = "__RsWoodcutting__/graphics/icons/"..item_data.name.."tree.png",
        icon_size = 32,
        order = "rs-trees-001-tree"..add_leading_zeros(item_level,3),
        corpse = corpse_name,
        pictures = {
          {
            filename = "__RsWoodcutting__/graphics/entity/"..item_data.name.."tree/"..item_data.name.."tree.png",
            width = item_data.width,
            height = item_data.height,
            shift = item_data.shift,
            scale = 0.5*157/175,
          }
        },
        autoplace = item_data.autoplace
      },
      {
        type = "corpse",
        name = corpse_name,
        time_before_removed = 54000,
        tile_width = 2,
        tile_height = 2,
        subgroup = "remnants",
        collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        selectable_in_game = false,
        icon = "__RsWoodcutting__/graphics/icons/"..item_data.name.."tree-stump.png",
        icon_size = 32,
        order = "rs-trees-002-stump"..add_leading_zeros(item_level,3),
        flags = {
          "placeable-neutral",
          "not-on-map"
        },
        final_render_layer = "remnants",
        animation = {
          {
            direction_count = 1,
            frame_count = 1,
            filename = "__RsWoodcutting__/graphics/entity/"..item_data.name.."tree/"..item_data.name.."stump.png",
            width = item_data.width,
            height = item_data.height,
            shift = item_data.shift,
            scale = 0.5*157/175,
          }
        }
      }
    })

  end
end