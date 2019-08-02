require("__RsBase__.scripts.prototypes")

local miners = require("data.miner-data")

for material, item_data in pairs(miners) do
  local recipe_name = get_vanilla_name("rs-"..material.."-mining-drill")
  --technology should already exist
  local tech_name = get_vanilla_name("rs-"..material.."-pickaxe")
  local tech = data.raw.technology[tech_name]
  if tech then
    table.insert(tech.effects, {type = "unlock-recipe", recipe = recipe_name})
  end
  create_recipe({
    name = recipe_name,
    category = "crafting",
    energy_required = item_data.progress/50 * 2 * 0.6,
    ingredients = item_data.ingredients,
    results = {
      {recipe_name, 1}
    },
    enabled = tech == nil
  })
end