require("__RsUtility__.scripts.prototypes")

local iron_bar_tech = {
  name = "rs-iron-processing",
  recipes_to_unlock = {
    "rs-iron-bar",
    "electronic-circuit",
    "firearm-magazine",
    "inserter",
    "iron-chest",
    "iron-gear-wheel",
    "iron-stick",
    "pipe",
    "pipe-to-ground",
    "pistol",
    "radar",
    "steam-engine",
    "boiler",
    "offshore-pump",
    "automation-science-pack",
    "repair-pack",
    "electric-mining-drill",
    "lab",
    "light-armor",
    "transport-belt"
  },
  unit = {
    count = 20,
    time = 5,
    ingredients = {
      {name = "mining-1", amount =  1},
      {name = "smithing-1", amount = 1}
    }
  },
  levels = {
    ["mining"] = 10,
    ["smithing"] = 10
  },
  icon = "__RsMining__/graphics/technology/iron-technology.png",
  icon_size = 685
}
create_technology(iron_bar_tech)