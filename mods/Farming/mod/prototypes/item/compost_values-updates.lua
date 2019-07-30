require("__RsUtility__.scripts.prototypes")

--1/value indicates how many are required to fill one regular compost bucket
-- supercompost requires 4 times as much (might change)
local compost_items = {
  ["rs-oak-seed"] = 0.25,
  ["rs-willow-seed"] = 0.5,
  ["rs-maple-seed"] = 1,
  ["rs-yew-seed"] = 2,
  ["rs-magic-seed"] = 3,
  ["rs-empty-birds-nest"] = 1,
  ["rs-oak-roots"] = 2,
  ["rs-willow-roots"] = 5,
  ["rs-maple-roots"] = 10,
  ["rs-yew-roots"] = 15,
  ["rs-magic-roots"] = 20
}

for item_name, energy in pairs(compost_items) do
  local item = data.raw.item[get_vanilla_name(item_name)] or data.raw.tool[get_vanilla_name(item_name)]
  if item then
    item.fuel_category = "rs-compost"
    item.fuel_value = (100*energy).."kJ"
  end
end

