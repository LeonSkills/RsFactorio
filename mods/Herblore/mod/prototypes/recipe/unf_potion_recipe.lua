
require("__RsBase__.scripts.prototypes")
local herbs = require("__RsFarming__.data.herb_data")

local water_vial = data.raw.item[get_vanilla_name("rs-vial-of-water")]
local water_fluid = data.raw.fluid["water"]
local colours = require("__RsBase__.data.colours")

for herb, herb_data in pairs(herbs) do
  local unf_potion = data.raw.item[get_vanilla_name("rs-"..herb.."-potion-(unf)")]
  local unf_fluid = data.raw.fluid[get_vanilla_name("rs-unfinished-"..herb)]
  create_recipe({
    name = unf_potion.name.."-item",
    category = "rs-herblore",
    energy_required = 0.6,
    ingredients = {{name="rs-clean-"..herb, amount=1}, {name="rs-vial-of-water", amount=1, catalyst_amount=1}},
    results = {{name=unf_potion.name, amount=1, catalyst_amount=1}},
    main_product = unf_potion.name,
    icons = {
      {
        icon = unf_potion.icon,
        icon_size = 32,
        scale = 32/unf_potion.icon_size
      },
      {
        icon = water_vial.icon,
        scale = 16/water_vial.icon_size,
        shift = {-8, 8}
      }
    },
    icon_size = 32
  })
  create_recipe({
    name = unf_potion.name.."-fluid",
    category = "rs-herblore",
    energy_required = 0.6,
    ingredients = {{name="rs-clean-"..herb, amount=1}, {type="fluid", name="water", amount=50}, {name="rs-vial", amount=1, catalyst_amount=1}},
    results = {{name=unf_potion.name, amount=1, catalyst_amount=1}},
    main_product = unf_potion.name,
    icons = {
      {
        icon = unf_potion.icon,
        icon_size = 32,
        scale = 32/unf_potion.icon_size
      },
      {
        icon = water_fluid.icon,
        scale = 16/water_fluid.icon_size,
        shift = {-8, 8}
      }
    },
    icon_size = 32,
    allow_decomposition = false,
    hide_from_player_crafting = true
  })
  create_recipe({
    name = unf_fluid.name.."-item",
    category = "rs-herblore",
    energy_required = 0.6,
    ingredients = {{name="rs-clean-"..herb, amount=1}, {name="rs-vial-of-water", amount=1, catalyst_amount=1}},
    results = {{type="fluid", name=unf_fluid.name, amount=50}, {name="rs-vial", amount=1, catalyst_amount=1}},
    main_product = unf_fluid.name,
    icons = {
      {
        icon = "__RsHerblore__/graphics/icons/fluid-base.png",
        tint = colours[herb].unfinished,
        icon_size = 32
      },
      {
        icon = water_vial.icon,
        scale = 16/water_vial.icon_size,
        shift = {-8, 8}
      }
    },
    icon_size = 32,
    hide_from_player_crafting = true
  })
  create_recipe({
    name = unf_fluid.name.."-fluid",
    category = "rs-herblore",
    energy_required = 0.6,
    ingredients = {{name="rs-clean-"..herb, amount=1}, {type="fluid", name="water", amount=50}},
    results = {{type="fluid", name=unf_fluid.name, amount=50}},
    main_product = unf_fluid.name,
    icons = {
      {
        icon = "__RsHerblore__/graphics/icons/fluid-base.png",
        tint = colours[herb].unfinished,
        icon_size = 32
      },
      {
        icon = water_fluid.icon,
        scale = 16/water_fluid.icon_size,
        shift = {-8, 8}
      }
    },
    icon_size = 32,
    allow_decomposition = false,
    hide_from_player_crafting = true
  })

  -- vialing/unvialing
  create_recipe({
    name = "rs-vialing-"..herb,
    category = "rs-herblore",
    energy_required = 0.6,
    ingredients = {{type="fluid", name=unf_fluid.name, amount=50}, {name="rs-vial", amount=1, catalyst_amount=1}},
    results = {{name=unf_potion.name, amount=1, catalyst_amount=1}},
    subgroup = "rs-herblore-vialling",
    order = "rs-vialing-"..add_leading_zeros(herb_data.level, 3).."-01-vial",
    icons = {
      {
        icon = "__RsHerblore__/graphics/icons/vial.png",
        icon_size = 32
      },
      {
        icon = "__RsHerblore__/graphics/icons/fluid-base.png",
        tint = colours[herb].unfinished,
        icon_size = 32,
        scale = 0.5,
        shift = {8, -8}
      },
    },
    icon_size = 32,
    allow_decomposition = false
  })
  create_recipe({
    name = "rs-unvialing-"..herb,
    category = "rs-herblore",
    energy_required = 0.6,
    ingredients = {{name=unf_potion.name, amount=1, catalyst_amount=1}},
    results = {{type="fluid", name=unf_fluid.name, amount=50}, {name="rs-vial", amount=1, catalyst_amount=1}},
    subgroup = "rs-herblore-unvialling",
    order = "rs-vialing-"..add_leading_zeros(herb_data.level, 3).."-02-unvial",
    icons = {
      {
        icon = "__RsHerblore__/graphics/icons/unvial.png",
        icon_size = 64,
      },
      {
        icon = "__RsHerblore__/graphics/icons/fluid-base.png",
        tint = colours[herb].unfinished,
        icon_size = 32,
        scale = 0.5,
        shift = {0, 8}
      },
    },
    icon_size = 64,
    allow_decomposition = false
  })
end

-- let's do water vialing/unvialing here too
  -- vialing/unvialing
create_recipe({
  name = "rs-vialing-water",
  category = "rs-herblore",
  energy_required = 0.6,
  ingredients = {{type="fluid", name="water", amount=50}, {name = "rs-vial", amount=1, catalyst_amount=1}},
  results = {{name="rs-vial-of-water", amount=1, catalyst_amount=1}},
  main_product = "rs-vial-of-water",
  subgroup = "rs-herblore-vialling",
  order = "rs-vialing-"..add_leading_zeros(0, 3).."-01-vial",
    icons = {
      {
        icon = "__RsHerblore__/graphics/icons/vial.png",
        icon_size = 32
      },
      {
        icon = water_fluid.icon,
        icon_size = 32,
        scale = 0.5,
        shift = {8, -8}
      },
    },
    icon_size = 32,
  allow_decomposition = false
})
create_recipe({
  name = "rs-unvialing-water",
  category = "rs-herblore",
  energy_required = 0.6,
  ingredients = {{name="rs-vial-of-water", amount=1, catalyst_amount=1}},
  results = {{type="fluid", name="water", amount=50}, {name = "rs-vial", amount=1, catalyst_amount=1}},
  main_product = "water",
  subgroup = "rs-herblore-unvialling",
  order = "rs-vialing-"..add_leading_zeros(0, 3).."-02-unvial",
    icons = {
      {
        icon = "__RsHerblore__/graphics/icons/unvial.png",
        icon_size = 64,
      },
      {
        icon = water_fluid.icon,
        icon_size = 32,
        scale = 0.5,
        shift = {0, 8}
      },
    },
    icon_size = 64,
  allow_decomposition = false
})