require("__RsUtility__.scripts.prototypes")
local patch_data = require("data.patch_data")

-- only do this if woodcutting is enabled
if not mods["RsWoodcutting"] then return end

for index, patch in pairs(patch_data) do
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
    localised_name = {"recipe-name.rs-"..patch.name.."-growing"}
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
    localised_name = {"recipe-name.rs-"..patch.name.."-growing-compost"}
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
    localised_name = {"recipe-name.rs-"..patch.name.."-growing-supercompost"}
  })
end
