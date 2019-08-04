-- regular potion recipes

require("__RsBase__.scripts.prototypes")

local potions = require("__RsHerblore__.data.potion_data")

for potion_name, data in pairs(potions) do
  local factorio_name = "rs-"..potion_name
  local ingredients = data.extra_ingredients or {}
  for _, ingredient in pairs(data.secondaries or {}) do
    table.insert(ingredients, {"rs-"..ingredient, 1})
  end
  if data.herb then
    table.insert(ingredients, 1, {"rs-"..data.herb.."-potion-(unf)", 1})
  end
  local results = {{factorio_name, 1}}
  print(potion_name, ingredients)
  create_recipe({
    name = factorio_name,
    category = "rs-herblore",
    energy_required = 15,
    ingredients = ingredients,
    results = results,
    main_ingredient = get_vanilla_name(factorio_name)
  })
end