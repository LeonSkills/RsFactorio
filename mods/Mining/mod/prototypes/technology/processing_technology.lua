require("__RsUtility__.scripts.prototypes")

local iron_bar_tech = {
  name = "rs-iron-processing",
  recipes_to_unlock = {
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
    time = 5
  },
  levels = {
    ["mining"] = 10,
    ["smithing"] = 10
  },
  extra_prerequisites = {"rs-iron-bar"},
  icon = "__RsMining__/graphics/technology/iron-technology.png",
  icon_size = 685
}
create_technology(iron_bar_tech, true)

local steel_bar_tech = {
  name = "rs-steel-processing",
  recipes_to_unlock = {
    "steel-chest"
  },
  unit = {
    count = 50,
    time = 5
  },
  levels = {
    ["mining"] = 20,
    ["smithing"] = 20
  },
  icon = "__RsMining__/graphics/technology/steel-technology.png",
  icon_size = 685,
  extra_prerequisites = {"rs-iron-processing", "rs-steel-bar"}
}
create_technology(steel_bar_tech, true)