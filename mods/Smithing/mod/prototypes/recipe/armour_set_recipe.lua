require("__RsBase__.scripts.prototypes")

local armours = require("__RsSmithing__.data.armour_data")

for mat, data in pairs(armours) do
  local shield = data.shield.."shield"
  local armour_set = {
    name = "rs-"..mat.."-armour-set",
    ingredients = {
      {"rs-"..mat.."-gauntlets", 1},
      {"rs-"..mat.."-armoured-boots", 1},
      {"rs-"..mat.."-full-helm", 1},
      {"rs-"..mat.."-"..shield, 1},
      {"rs-"..mat.."-platelegs", 1},
      {"rs-"..mat.."-platebody", 1},
    },
    results = {
      { "rs-"..mat.."-armour-set", 1}
    },
    energy_required = 0.6 * data.base_speed + 0.6,
  }
  create_recipe(armour_set)
end