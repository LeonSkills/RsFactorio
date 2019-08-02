require("__RsBase__.scripts.prototypes")

local armours = require("__RsSmithing__.data.armour_data")

for mat, data in pairs(armours) do
  local gauntlets = {
    name = "rs-"..mat.."-gauntlets",
    category = "rs-smithing",
    ingredients = {
      {"rs-"..mat.."-bar", 1},
    },
    results = {
      { "rs-"..mat.."-gauntlets", 1}
    },
    energy_required = 0.6 * data.base_speed,
  }
  create_recipe(gauntlets)
  local boots = {
    name = "rs-"..mat.."-armoured-boots",
    category = "rs-smithing",
    ingredients = {
      {"rs-"..mat.."-bar", 1},
    },
    results = {
      { "rs-"..mat.."-armoured-boots", 1}
    },
    energy_required = 0.6 * data.base_speed,
  }
  create_recipe(boots)
  local helm = {
    name = "rs-"..mat.."-full-helm",
    category = "rs-smithing",
    ingredients = {
      {"rs-"..mat.."-bar", 2},
    },
    results = {
      { "rs-"..mat.."-full-helm", 1}
    },
    energy_required = 2 * 0.6 * data.base_speed,
  }
  create_recipe(helm)
  local shield = {
    name = "rs-"..mat.."-"..data.shield.."shield",
    category = "rs-smithing",
    ingredients = {
      {"rs-"..mat.."-bar", 3},
    },
    results = {
      { "rs-"..mat.."-"..data.shield.."shield", 1}
    },
    energy_required = 3 * 0.6 * data.base_speed,
  }
  create_recipe(shield)
  local platelegs = {
    name = "rs-"..mat.."-platelegs",
    category = "rs-smithing",
    ingredients = {
      {"rs-"..mat.."-bar", 3},
    },
    results = {
      { "rs-"..mat.."-platelegs", 1}
    },
    energy_required = 3 * 0.6 * data.base_speed,
  }
  create_recipe(platelegs)
  local platebody = {
    name = "rs-"..mat.."-platebody",
    category = "rs-smithing",
    ingredients = {
      {"rs-"..mat.."-bar", 5},
    },
    results = {
      { "rs-"..mat.."-platebody", 1}
    },
    energy_required = 5 * 0.6 * data.base_speed,
  }
  create_recipe(platebody)
end