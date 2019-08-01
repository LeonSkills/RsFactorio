require("__RsUtility__.scripts.prototypes")
require("__RsUtility__.scripts.utility")
local herbs = require("__RsFarming__.data.herb_data")

local amount_min = 4
local amount_max = 16

local compost_icon = get_prototype("rs-compost", "item").icon
local supercompost_icon = get_prototype("rs-supercompost", "item").icon


local i = 1
for herb, herb_data in pairs(herbs) do
  local grimy_herb = get_prototype("rs-grimy-"..herb, "item")

  create_recipe({
    name = "rs-"..herb.."-farming",
    energy_required = i * 12 + 12,
    category = "rs-herb-farming",
    ingredients = {
      {"rs-"..herb.."-seed", 1}
    },
    results = {
      {name = "rs-grimy-"..herb, amount_min = amount_min, amount_max = amount_max},
      {name = "rs-"..herb.."-seed", amount = 1, probability = 1/10}
    },
    main_product = "rs-grimy-"..herb,
    order = "rs-herb-farming-"..add_leading_zeros(herb_data.level, 3).."-000",
    allow_decomposition = false
  })

  create_recipe({
    name = "rs-"..herb.."-farming-compost",
    energy_required = i * 12 + 12,
    category = "rs-herb-farming",
    ingredients = {
      {"rs-"..herb.."-seed", 1},
      {name = "rs-compost", amount = 1, catalyst_amount = 1}
    },
    results = {
      {name = "rs-grimy-"..herb, amount_min = amount_min*1.5, amount_max = amount_max*1.5},
      {name = "rs-"..herb.."-seed", amount = 1, probability = 1/10},
      {name = "rs-bucket", amount = 1, catalyst_amount = 1}
    },
    main_product = "rs-grimy-"..herb,
    order = "rs-herb-farming-"..add_leading_zeros(herb_data.level, 3).."-001",
    allow_decomposition = false,
    localised_name = {"", {"item-name.rs-grimy-"..herb}, "+"},
    icons = {
      {
        icon = grimy_herb.icon,
        icon_size = 32,
        scale = 32/grimy_herb.icon_size
      },
      {
        icon = compost_icon,
        scale = 0.5,
        shift = {-8, 8}
      }
    },
    icon_size = 32
  })

  create_recipe({
    name =  "rs-"..herb.."-farming-supercompost",
    energy_required = i * 12 + 12,
    category = "rs-herb-farming",
    ingredients = {
      {"rs-"..herb.."-seed", 1},
      {name = "rs-supercompost", amount = 1, catalyst_amount = 1}
    },
    results = {
      {name = "rs-grimy-"..herb, amount_min = amount_min*2, amount_max = amount_max*2},
      {name = "rs-"..herb.."-seed", amount = 1, probability = 1/10},
      {name = "rs-bucket", amount = 1, catalyst_amount = 1}
    },
    main_product = "rs-grimy-"..herb,
    order = "rs-herb-farming-"..add_leading_zeros(herb_data.level, 3).."-002",
    allow_decomposition = false,
    localised_name = {"", {"item-name.rs-grimy-"..herb}, "++"},
    icons = {
      {
        icon = grimy_herb.icon,
        icon_size = 32,
        scale = 32/grimy_herb.icon_size
      },
      {
        icon = supercompost_icon,
        scale = 0.5,
        shift = {-8, 8}
      }
    },
    icon_size = 32
  })

  create_recipe({
    name = "rs-clean-"..herb,
    energy_required = 0.6,
    ingredients = {
      {"rs-grimy-"..herb, 1}
    },
    results = {
      {"rs-clean-"..herb, 1}
    }
  })
  i = i + 1
end