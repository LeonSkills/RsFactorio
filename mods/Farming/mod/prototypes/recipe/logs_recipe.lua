require("__RsBase__.scripts.prototypes")
local patch_data = require("data.patch_data")

-- only do this if woodcutting is enabled
if not mods["RsWoodcutting"] then return end

local compost_icon = get_prototype("rs-compost", "item").icon
local supercompost_icon = get_prototype("rs-supercompost", "item").icon

for index, patch in pairs(patch_data) do
  local log_item = get_prototype("rs-"..patch.name.."-logs", "item")
  create_recipe({
    name = "rs-"..patch.name.."-growing",
    category = get_vanilla_name("rs-"..patch.name.."-farming"),
    main_product = get_vanilla_name("rs-"..patch.name.."-logs"),
    subgroup = "rs-log-farming",
    order = "rs-resource-"..add_leading_zeros(index, 3).."-001-"..patch.name,
    emissions_multiplier = -1 * index,
    energy_required = patch.mining_time,
    allow_decomposition = false,
    ingredients = {
    },
    results = {
      {name = "rs-"..patch.name.."-logs", amount_min = patch.amount_min, amount_max = patch.amount_max},
      {name = "rs-birds-nest", amount = 1, probability = 1/40 * index}
    },
    localised_name = {"item-name.rs-"..patch.name.."-logs"}
  })

  create_recipe({
    name = "rs-"..patch.name.."-growing-compost",
    category = get_vanilla_name("rs-"..patch.name.."-farming"),
    main_product = get_vanilla_name("rs-"..patch.name.."-logs"),
    subgroup = "rs-log-farming",
    order = "rs-resource-"..add_leading_zeros(index, 3).."-002-"..patch.name,
    emissions_multiplier = -1 * index,
    energy_required = patch.mining_time,
    allow_decomposition = false,
    ingredients = {
      {name = "rs-compost", amount = 1, catalyst_amount = 1}
    },
    results = {
      {name = "rs-"..patch.name.."-logs", amount_min = patch.amount_min*1.5, amount_max = patch.amount_max*1.5},
      {name = "rs-birds-nest", amount = 1, probability = 1/40 * index},
      {name = "rs-bucket", amount = 1, catalyst_amount = 1}
    },
    localised_name = {"", {"item-name.rs-"..patch.name.."-logs"}, "+"},
    icons = {
      {
        icon = log_item.icon,
        icon_size = 32,
        scale = 32/ log_item.icon_size
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
    name = "rs-"..patch.name.."-growing-supercompost",
    category = get_vanilla_name("rs-"..patch.name.."-farming"),
    main_product = get_vanilla_name("rs-"..patch.name.."-logs"),
    subgroup = "rs-log-farming",
    order = "rs-resource-"..add_leading_zeros(index, 3).."-003-"..patch.name,
    emissions_multiplier = -1 * index,
    energy_required = patch.mining_time,
    allow_decomposition = false,
    ingredients = {
      {name = "rs-supercompost", amount = 1, catalyst_amount = 1}
    },
    results = {
      {name = "rs-"..patch.name.."-logs", amount_min = patch.amount_min*2, amount_max = patch.amount_max*2},
      {name = "rs-birds-nest", amount = 1, probability = 1/40 * index},
      {name = "rs-bucket", amount = 1, catalyst_amount = 1}
    },
    localised_name = {"", {"item-name.rs-"..patch.name.."-logs"}, "++"},
    icons = {
      {
        icon = log_item.icon,
        icon_size = 32,
        scale = 32/ log_item.icon_size
      },
      {
        icon = supercompost_icon,
        scale = 0.5,
        shift = {-8, 8}
      }
    },
    icon_size = 32
  })
end
