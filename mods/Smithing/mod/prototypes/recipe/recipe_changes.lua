require("__RsBase__.scripts.prototypes")


-- Recipes to update that require new items
local recipe_updates = {
  ["uranium-fuel-cell"] = {
    to_replace = {
      {replace_item = "iron-plate", with_item = "rs-necronium-bar", amount=100}
    }
  },
  ["advanced-circuit"] = {
    to_replace = {
      {replace_item = "copper-cable", with_item = "rs-adamant-cable"}
    }
  },
  ["processing-unit"] = {
    to_add = {
      {"rs-orikalkum-cable", 5}
    }
  },
  ["green-cable"] = {
    to_replace = {
      {replace_item = "copper-cable", with_item = "rs-adamant-cable"}
    }
  },
  ["red-cable"] = {
    to_replace = {
      {replace_item = "copper-cable", with_item = "rs-orikalkum-cable"}
    }
  },
  ["burner-inserter"] = {
    to_replace = {
      {replace_item = "iron-plate", with_item = "rs-bronze-bar"},
      {replace_item = "iron-gear-wheel", with_item = "rs-bronze-nails", amount = 5}
    }
  },
  ["burner-mining-drill"] = {
    to_replace = {
      {replace_item = "iron-plate", with_item = "rs-bronze-bar"},
      {replace_item = "iron-gear-wheel", with_item = "rs-clay"}
    }
  },
  ["stone-brick"] = {
    to_replace = {
      {replace_item = "stone", with_item = "rs-soft-clay"}
    }
  }
}

for recipe_name, recipe_data in pairs(recipe_updates) do
  if data.raw.recipe[recipe_name] ~= nil then
    local recipe = data.raw.recipe[recipe_name]
    if recipe_data.to_replace ~= nil then
      for _, mode in pairs({recipe, recipe.normal, recipe.expensive}) do
        if mode ~= nil and mode.ingredients ~= nil then
          for _, ingredient in pairs(mode.ingredients) do
            for _, item in pairs(recipe_data.to_replace) do
              if ingredient.name ~= nil and ingredient.name == item.replace_item then
                ingredient.name = get_vanilla_name(item.with_item)
                if item.amount ~= nil then
                  ingredient.amount = item.amount
                end
              elseif ingredient[1] ~= nil and ingredient[1] == item.replace_item then
                ingredient.name = get_vanilla_name(item.with_item)
                if item.amount ~= nil then
                  ingredient.amount = item.amount
                else
                  ingredient.amount = ingredient[2]
                end
              end
            end
          end
        end
      end
    end
    if recipe_data.to_add ~= nil then
      for _, to_add in pairs(recipe_data.to_add) do
        for _, mode in pairs({recipe, recipe.normal, recipe.expensive}) do
          if mode ~= nil and mode.ingredients ~= nil then
            table.insert(mode.ingredients, get_vanilla_name(to_add))
          end
        end
      end
    end
  end
end