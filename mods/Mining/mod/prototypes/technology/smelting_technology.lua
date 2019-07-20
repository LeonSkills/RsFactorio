require("__RsUtility__.scripts.prototypes")

local iron_bar_tech = {
  name = "rs-iron-bar",
  recipes_to_unlock = {
    "rs-iron-bar"
  },
  unit = {
    count = 10,
    time = 5
  },
  levels = {
    ["mining"] = 10,
    ["smithing"] = 10
  },
  icon = "__RsMining__/graphics/technology/iron_ore.png",
  icon_size = 685
}
create_technology(iron_bar_tech, true)

local steel_bar_tech = {
  name = "rs-steel-bar",
  recipes_to_unlock = {
    "rs-steel-bar"
  },
  unit = {
    count = 20,
    time = 5
  },
  levels = {
    ["mining"] = 20,
    ["smithing"] = 20
  },
  icon = "__RsMining__/graphics/technology/coal_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-iron-bar"}
}
create_technology(steel_bar_tech, true)

local mithril_bar_tech = {
  name = "rs-mithril-bar",
  recipes_to_unlock = {
    "rs-mithril-bar"
  },
  unit = {
    count = 75,
    time = 5
  },
  levels = {
    ["mining"] = 30,
    ["smithing"] = 30
  },
  icon = "__RsMining__/graphics/technology/mithril_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-steel-bar"}
}
create_technology(mithril_bar_tech, true)

local adamant_bar_tech = {
  name = "rs-adamant-bar",
  recipes_to_unlock = {
    "rs-adamant-bar"
  },
  unit = {
    count = 150,
    time = 5
  },
  levels = {
    ["mining"] = 40,
    ["smithing"] = 40
  },
  icon = "__RsMining__/graphics/technology/adamant_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-mithril-bar"}
}
create_technology(adamant_bar_tech, true)


local rune_bar_tech = {
  name = "rs-rune-bar",
  recipes_to_unlock = {
    "rs-rune-bar"
  },
  unit = {
    count = 300,
    time = 5
  },
  levels = {
    ["mining"] = 50,
    ["smithing"] = 50
  },
  icon = "__RsMining__/graphics/technology/rune_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-adamant-bar"}
}
create_technology(rune_bar_tech, true)

local orikalkum_bar_tech = {
  name = "rs-orikalkum-bar",
  recipes_to_unlock = {
    "rs-orikalkum-bar"
  },
  unit = {
    count = 500,
    time = 5
  },
  levels = {
    ["mining"] = 60,
    ["smithing"] = 60
  },
  icon = "__RsMining__/graphics/technology/orikalkum_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-rune-bar"}
}
create_technology(orikalkum_bar_tech, true)


local necronium_bar_tech = {
  name = "rs-necronium-bar",
  recipes_to_unlock = {
    "rs-necronium-bar"
  },
  unit = {
    count = 750,
    time = 5
  },
  levels = {
    ["mining"] = 70,
    ["smithing"] = 70
  },
  icon = "__RsMining__/graphics/technology/necronium_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-orikalkum-bar"}
}
create_technology(necronium_bar_tech, true)

local bane_bar_tech = {
  name = "rs-bane-bar",
  recipes_to_unlock = {
    "rs-bane-bar"
  },
  unit = {
    count = 1000,
    time = 5
  },
  levels = {
    ["mining"] = 80,
    ["smithing"] = 80
  },
  icon = "__RsMining__/graphics/technology/bane_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-necronium-bar"}
}
create_technology(bane_bar_tech, true)

local elder_rune_bar_tech = {
  name = "rs-elder-rune-bar",
  recipes_to_unlock = {
    "rs-elder-rune-bar"
  },
  unit = {
    count = 1500,
    time = 5
  },
  levels = {
    ["mining"] = 90,
    ["smithing"] = 90
  },
  icon = "__RsMining__/graphics/technology/elder_rune_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-bane-bar"}
}
create_technology(elder_rune_bar_tech, true)


