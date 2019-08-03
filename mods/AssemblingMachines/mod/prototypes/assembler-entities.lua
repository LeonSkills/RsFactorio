require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")
local assemblers = require("data.assembler-data")
local colours = require("__RsBase__.data.colours")

local copies = {
  [1] = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"]),
  [2] = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"]),
  [3] = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
}

local assembler_data = {
  [1] = {width = 214, height = 226, shift = {0, 0.0625}, shadow_animation = copies[1].animation.layers[2]},
  [2] = {width = 214, height = 218, shift = {0, 0.1250}, shadow_animation = copies[2].animation.layers[2]},
  [3] = {width = 214, height = 237, shift = {0, -0.0234375}, shadow_animation = copies[3].animation.layers[2]}
}

local pipe_data = {
  east = {height = 76, width = 42, shift = {-0.78125, 0.03125}},
  north = {height = 38, width = 71, shift = {0.0703125, 0.421875}},
  south = {height = 61, width = 88, shift = {0, -0.9765625}},
  west = {height = 73, width = 39, shift = {0.8046875, 0.0390625}}
}

for tier, item_data in pairs(assemblers) do
  local entity = table.deepcopy(copies[item_data.based_on])
  entity.name = get_vanilla_name( "rs-"..item_data.material .."-assembling-machine")
  entity.icons = {
      {
        icon = "__RsAssemblers__/graphics/icons/base-"..item_data.based_on..".png",
        icon_size=32,
        tint=colours[item_data.material].light
      },
      {
        icon = "__RsAssemblers__/graphics/icons/top-"..item_data.based_on..".png",
        icon_size=32,
      }
    }
  entity.icon_size = 32
  entity.order = "rs-assemblers-"..add_leading_zeros(tier, 3).."-"..item_data.material
  entity.crafting_speed = item_data.speed
  entity.energy_usage =   item_data.energy_consumption
  entity.minable.result = entity.name
  entity.next_upgrade = get_vanilla_name(item_data.next_upgrade or entity.next_upgrade)
  if item_data.energy_type == "burner" then
    entity.energy_source = {
      type = "burner",
      fuel_inventory_size = 1,
      fuel_categories = {"chemical", "nuclear"},
      emissions_per_second_per_watt = 1/9000 -- idk, also, why is this not called emissions_per_joule?
    }
  end
  entity.animation = {
    layers = {
      {
        filename = "__RsAssemblers__/graphics/entity/assembler-blocks/base-"..item_data.based_on..".png",
        width = assembler_data[item_data.based_on].width,
        height = assembler_data[item_data.based_on].height,
        shift = assembler_data[item_data.based_on].shift,
        scale = 0.5,
        frame_count = 32,
        line_length = 8,
        priority = "high",
        tint = colours[item_data.material].light
      },
      layers = {
        filename = "__RsAssemblers__/graphics/entity/assembler-blocks/top-"..item_data.based_on..".png",
        width = assembler_data[item_data.based_on].width,
        height = assembler_data[item_data.based_on].height,
        shift = assembler_data[item_data.based_on].shift,
        scale = 0.5,
        frame_count = 32,
        line_length = 8,
        priority = "high"
      },
      assembler_data[item_data.based_on].shadow_animation
    }
  }
  -- add pipe connections
  if item_data.based_on >= 2 then
    for _, dir in pairs({"north", "east", "south", "west"}) do
      for i = 1, 2 do
        entity.fluid_boxes[i].pipe_picture[dir] = {
          layers = {
            {
              filename = "__RsAssemblers__/graphics/entity/assembler-blocks/pipe-"..dir..".png",
              height = pipe_data[dir].height,
              width = pipe_data[dir].width,
              shift = pipe_data[dir].shift,
              scale = 0.5,
              priority = "extra-high",
            },
            {
              filename = "__RsAssemblers__/graphics/entity/assembler-blocks/pipe-base-"..dir..".png",
              height = pipe_data[dir].height,
              width = pipe_data[dir].width,
              shift = pipe_data[dir].shift,
              scale = 0.5,
              priority = "extra-high",
              tint = colours[item_data.material].medium
            },
          }
        }
      end

    end

  end
  entity.localised_name = {"item-names.rs-"..item_data.material.."-assembling-machine"}
  data.raw["assembling-machine"][entity.name] = nil
  data:extend({entity})

end