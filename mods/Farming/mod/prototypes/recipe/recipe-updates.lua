require("__RsBase__.scripts.prototypes")

-- remove plank and bronze nails from farm patch if it doesn't exist
local patch_recipe = data.raw.recipe[get_vanilla_name("rs-farming-patch")]
for index, ingredient in pairs(patch_recipe.ingredients) do
  if ingredient[1] == get_vanilla_name("rs-plank") then
    if not data.raw.item[ingredient[1]] and not data.raw.tool[ingredient[1]] then
      ingredient[1] = "wood"
    end
  elseif ingredient[1] == get_vanilla_name("rs-bronze-nails") then
    if not data.raw.item[ingredient[1]] and not data.raw.tool[ingredient[1]] then
      patch_recipe.ingredients[index] = nil
    end
  end
end

-- remove farm patch from oak planks if oak plank doesn't exist
if not data.raw.item[get_vanilla_name("rs-oak-plank")] then
  data.raw.recipe[get_vanilla_name("rs-farming-patch-oak")] = nil
end

--remove plank and bronze nails from compost bin
local bin_recipe = data.raw.recipe[get_vanilla_name("rs-compost-bin")]
for index, ingredient in pairs(bin_recipe.ingredients) do
  if ingredient[1] == get_vanilla_name("rs-plank") then
    if not data.raw.item[ingredient[1]] and not data.raw.tool[ingredient[1]] then
      ingredient[1] = "wood"
    end
  elseif ingredient[1] == get_vanilla_name("rs-bronze-nails") then
    if not data.raw.item[ingredient[1]] and not data.raw.tool[ingredient[1]] then
      bin_recipe.ingredients[index] = nil
    end
  end
end

--remove plank and bronze nails from bucket
local bucket_recipe = data.raw.recipe[get_vanilla_name("rs-bucket")]
for index, ingredient in pairs(bucket_recipe.ingredients) do
  if ingredient[1] == get_vanilla_name("rs-plank") then
    if not data.raw.item[ingredient[1]] and not data.raw.tool[ingredient[1]] then
      ingredient[1] = "wood"
    end
  elseif ingredient[1] == get_vanilla_name("rs-bronze-nails") then
    if not data.raw.item[ingredient[1]] and not data.raw.tool[ingredient[1]] then
      bucket_recipe.ingredients[index] = nil
    end
  end
end