local noise = require("noise")
resource_autoplace = require("resource-autoplace")

require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")
local herbs = require("__RsFarming__.data.herb_data")

local amount_min = 4
local amount_max = 16
for herb, herb_data in pairs(herbs) do
  local entity = get_prototype("rs-wild-"..herb, "simple-entity")
  entity.count_as_rock_for_filtered_deconstruction = true
  entity.render_layer = "object"
  entity.pictures = {}
  for i = 2, 4 do
    table.insert(entity.pictures, {
      filename = "__RsFarming__/graphics/entity/herb-farming-patch/herb_stages_tint.png",
      width = 300,
      height = 300,
      x = i * 300,
      scale = 0.25/3*2,
      tint = herb_data.tint
    })
  end
  entity.localised_name = {"herb.rs-herb", {"herb.Rs-"..herb}}
  entity.max_health = 10
  entity.loot = {
    {
      item = get_vanilla_name("rs-"..herb.."-seed"),
      count_min = 1,
      count_max = 3,
      probability = 0.4
    },
    {
      item = get_vanilla_name("rs-grimy-"..herb),
      count_min = amount_min/2,
      count_max = amount_max/2,
      probability = 0.1
    }
  }
  entity.minable = {
    mining_time = 1.2,
    results = {
    {
      name = get_vanilla_name("rs-"..herb.."-seed"),
      amount_min = 1,
      amount_max = 5,
      probability = 0.9
    },
    {
      name = get_vanilla_name("rs-grimy-"..herb),
      amount_min = amount_min,
      amount_max = amount_max,
      probability = 0.1
    }
  }
  }
  entity.create_ghost_on_death = false
  entity.icons = {
    {
      icon = "__RsFarming__/graphics/icons/herb_icon.png",
      icon_size = 64,
      tint = herb_data.tint
    }
  }
  entity.collision_box = {{-0.4, -0.4}, {0.4, 0.4}}
  entity.collision_mask = {"item-layer", "object-layer"}
  entity.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
  entity.flags = {
    "placeable-neutral",
    "placeable-off-grid"
  }
  entity.subgroup = "grass"
  entity.order = "rs-herb-"..add_leading_zeros(herb_data.level, 3)
  entity.emissions_per_second = -0.00001
  entity.map_color = herb_data.tint
  --copied from oil
  entity.autoplace = resource_autoplace.resource_autoplace_settings{
    name = "rs-herbs",
    order = "c-"..entity.order,
    base_density = 8.2,
    base_spots_per_km2 = 1.8 * 1/math.sqrt(herb_data.level),
    random_probability = 1/100,
    random_spot_size_minimum = 1,
    random_spot_size_maximum = 1, -- don't randomize spot size
    additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
    has_starting_area_placement = herb_data.level < 25,
    starting_rq_factor_multiplier = math.min(1, 25 - herb_data.level),
    regular_rq_factor_multiplier = 1,

    seed1 = herb_data.level * 3145387114
  }
end

data:extend({
  {
    type = "autoplace-control",
    name = "rs-herbs",
    category = "terrain",
    order = "c-x"
  }
})