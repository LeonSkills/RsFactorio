require("__RsBase__.scripts.prototypes")

local iron_bar_tech = {
  name = "rs-iron-bar",
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
    count = 10,
    time = 5
  },
  levels = {
    ["smithing"] = 10
  },
  icon = "__RsSmithing__/graphics/technology/iron_bar.png",
  icon_size = 685,
  localised_name = {"item-name.rs-iron-bar"}
}
create_technology(iron_bar_tech, true)

local steel_bar_tech = {
  name = "rs-steel-bar",
  recipes_to_unlock = {
    "rs-steel-bar",
    "steel-chest"
  },
  unit = {
    count = 20,
    time = 5
  },
  levels = {
    ["smithing"] = 20
  },
  icon = "__RsSmithing__/graphics/technology/steel_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-iron-bar"},
  localised_name = {"item-name.rs-steel-bar"}
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
    ["smithing"] = 30
  },
  icon = "__RsSmithing__/graphics/technology/mithril_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-steel-bar"},
  localised_name = {"item-name.rs-mithril-bar"}
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
    ["smithing"] = 40
  },
  icon = "__RsSmithing__/graphics/technology/adamant_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-mithril-bar"},
  localised_name = {"item-name.rs-adamant-bar"}
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
    ["smithing"] = 50
  },
  icon = "__RsSmithing__/graphics/technology/rune_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-adamant-bar"},
  localised_name = {"item-name.rs-rune-bar"}
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
    ["smithing"] = 60
  },
  icon = "__RsSmithing__/graphics/technology/orikalkum_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-rune-bar"},
  localised_name = {"item-name.rs-orikalkum-bar"}
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
    ["smithing"] = 70
  },
  icon = "__RsSmithing__/graphics/technology/necronium_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-orikalkum-bar"},
  localised_name = {"item-name.rs-necronium-bar"}
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
    ["smithing"] = 80
  },
  icon = "__RsSmithing__/graphics/technology/bane_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-necronium-bar"},
  localised_name = {"item-name.rs-necronium-bar"}
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
    ["smithing"] = 90
  },
  icon = "__RsSmithing__/graphics/technology/elder_rune_bar.png",
  icon_size = 685,
  extra_prerequisites = {"rs-bane-bar"},
  localised_name = {"item-name.rs-elder-rune-bar"}
}
create_technology(elder_rune_bar_tech, true)


