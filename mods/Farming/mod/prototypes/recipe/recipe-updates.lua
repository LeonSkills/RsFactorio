require("__RsUtility__.scripts.prototypes")

-- remove plank and bronze nails from farm patch if it doesn't exist
local recipe = data.raw.recipe[get_vanilla_name("rs-farming-patch")]
for index, ingredient in pairs(recipe.ingredients) do
  if ingredient[1] == get_vanilla_name("rs-plank") then
    if not data.raw.item[ingredient[1]] then
      ingredient[1] = "wood"
    end
  elseif ingredient[1] == get_vanilla_name("rs-bronze-nails") then
    if not data.raw.item[ingredient[1]] then
      recipe.ingredients[index] = nil
    end
  end
end

-- remove farm patch from oak planks if oak plank doesn't exist
if not data.raw.item[get_vanilla_name("rs-oak-plank")] then
  data.raw.recipe[get_vanilla_name("rs-farming-patch-oak")] = nil
end