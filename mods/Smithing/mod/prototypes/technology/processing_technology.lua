require("__RsBase__.scripts.prototypes")

local iron_processing_tech = {
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
    "transport-belt",
    "rs-iron-nails"
  },
  unit = {
    count = 10,
    time = 5
  },
  levels = {
    ["smithing"] = 10,
    ["mining"] = 10
  },
  icon = "__RsSmithing__/graphics/technology/iron_processing.png",
  icon_size = 128,
  localised_name = {"technology-name.rs-iron-processing"}
}
create_technology(iron_processing_tech, true)

local steel_processing_tech = {
  name = "rs-steel-processing",
  recipes_to_unlock = {
    "steel-chest",
    "rs-steel-nails"
  },
  unit = {
    count = 20,
    time = 5
  },
  levels = {
    ["smithing"] = 20,
    ["mining"] = 20
  },
  icon = "__RsSmithing__/graphics/technology/steel_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-iron-processing"},
  localised_name = {"technology-name.rs-steel-processing"}
}
create_technology(steel_processing_tech, true)

local mithril_processing_tech = {
  name = "rs-mithril-processing",
  recipes_to_unlock = {
    "rs-mithril-nails"
  },
  unit = {
    count = 75,
    time = 5
  },
  levels = {
    ["smithing"] = 30,
    ["mining"] = 30
  },
  icon = "__RsSmithing__/graphics/technology/mithril_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-steel-processing"},
  localised_name = {"technology-name.rs-mithril-processing"}
}
create_technology(mithril_processing_tech, true)

local adamant_processing_tech = {
  name = "rs-adamant-processing",
  recipes_to_unlock = {
    "rs-adamant-nails",
    "rs-adamant-cable"
  },
  unit = {
    count = 150,
    time = 5
  },
  levels = {
    ["smithing"] = 40,
    ["mining"] = 40
  },
  icon = "__RsSmithing__/graphics/technology/adamant_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-mithril-processing"},
  localised_name = {"technology-name.rs-adamant-processing"}
}
create_technology(adamant_processing_tech, true)


local rune_processing_tech = {
  name = "rs-rune-processing",
  recipes_to_unlock = {
    "rs-rune-nails"
  },
  unit = {
    count = 300,
    time = 5
  },
  levels = {
    ["smithing"] = 50,
    ["mining"] = 50
  },
  icon = "__RsSmithing__/graphics/technology/rune_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-adamant-processing"},
  localised_name = {"technology-name.rs-rune-processing"}
}
create_technology(rune_processing_tech, true)

local orikalkum_processing_tech = {
  name = "rs-orikalkum-processing",
  recipes_to_unlock = {
    "rs-orikalkum-cable"
  },
  unit = {
    count = 500,
    time = 5
  },
  levels = {
    ["smithing"] = 60,
    ["mining"] = 60
  },
  icon = "__RsSmithing__/graphics/technology/orikalkum_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-rune-processing"},
  localised_name = {"technology-name.rs-orikalkum-processing"}
}
create_technology(orikalkum_processing_tech, true)


local necronium_processing_tech = {
  name = "rs-necronium-processing",
  recipes_to_unlock = {
  },
  unit = {
    count = 750,
    time = 5
  },
  levels = {
    ["smithing"] = 70,
    ["mining"] = 70
  },
  icon = "__RsSmithing__/graphics/technology/necronium_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-orikalkum-processing"},
  localised_name = {"technology-name.rs-necronium-processing"}
}
create_technology(necronium_processing_tech, true)

local bane_processing_tech = {
  name = "rs-bane-processing",
  recipes_to_unlock = {
  },
  unit = {
    count = 1000,
    time = 5
  },
  levels = {
    ["smithing"] = 80,
    ["mining"] = 80
  },
  icon = "__RsSmithing__/graphics/technology/bane_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-necronium-processing"},
  localised_name = {"technology-name.rs-necronium-processing"}
}
create_technology(bane_processing_tech, true)

local elder_rune_processing_tech = {
  name = "rs-elder-rune-processing",
  recipes_to_unlock = {
  },
  unit = {
    count = 1500,
    time = 5
  },
  levels = {
    ["smithing"] = 90,
    ["mining"] = 90
  },
  icon = "__RsSmithing__/graphics/technology/elder_rune_processing.png",
  icon_size = 128,
  extra_prerequisites = {"rs-bane-processing"},
  localised_name = {"technology-name.rs-elder-rune-processing"}
}
create_technology(elder_rune_processing_tech, true)


