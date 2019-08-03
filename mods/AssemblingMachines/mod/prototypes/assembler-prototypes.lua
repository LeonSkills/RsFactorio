
require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")
local assemblers = require("data.assembler-data")
local colours = require("__RsBase__.data.colours")

for tier, item_data in pairs(assemblers) do
  local name = "rs-"..item_data.material.."-assembling-machine"
  create_item({
    name = name,
    stack_size = 50,
    order = "rs-assemblers-"..add_leading_zeros(tier, 3).."-"..item_data.material,
    subgroup = "rs-assembling-machine",
    icons = {
      {
        icon = "__RsAssemblers__/graphics/icons/base-"..item_data.based_on..".png",
        icon_size=32,
        tint=colours[item_data.material].light
      },
      {
        icon = "__RsAssemblers__/graphics/icons/top-"..item_data.based_on..".png",
        icon_size=32,
      }
    },
    icon_size = 32,
    localised_name = {"item-names.rs-"..item_data.material.."-assembling-machine"},
  }, true)

  create_recipe({
    name = name,
    energy_required = tier * 0.6 + 0.6,
    category = "crafting",
    ingredients = item_data.ingredients,
    results = {
      {name, 1}
    }
  })
end