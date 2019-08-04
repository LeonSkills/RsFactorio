-- regular potion recipes

require("__RsBase__.scripts.prototypes")

local potions = require("__RsHerblore__.data.combination_potion_data")

for potion_name, data in pairs(potions) do
  local factorio_name = "rs-"..potion_name
  local ingredients = data.potions or {}
  for _, secondary in pairs(data.secondaries or {}) do
    table.insert(ingredients, secondary)
  end
  local results = {{factorio_name, 1}}
  print(potion_name, ingredients)
  create_recipe({
    name = factorio_name,
    category = "rs-herblore",
    energy_required = 30,
    ingredients = ingredients,
    results = results,
    main_ingredient = get_vanilla_name(factorio_name)
  })
end