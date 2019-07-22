require("__RsUtility__.scripts.prototypes")

local iron_pick_tech = {
  name = "rs-iron-armour",
  recipes_to_unlock = {
    "rs-iron-gauntlets",
    "rs-iron-armoured-boots",
    "rs-iron-full-helm",
    "rs-iron-kiteshield",
    "rs-iron-platelegs",
    "rs-iron-platebody"
  },
  unit = {
    count = 10,
    time = 5
  },
  levels = {
    ["smithing"] = 10
  },
  extra_prerequisites = {"rs-iron-bar"},
  icon = "__RsSmithing__/graphics/technology/iron-armour.png",
  icon_size = 727,
  localised_name = {"technology-name.rs-iron-armour"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(iron_pick_tech, true)

local steel_pick_tech = {
  name = "rs-steel-armour",
  recipes_to_unlock = {
    "rs-steel-gauntlets",
    "rs-steel-armoured-boots",
    "rs-steel-full-helm",
    "rs-steel-kiteshield",
    "rs-steel-platelegs",
    "rs-steel-platebody"
  },
  unit = {
    count = 20,
    time = 5
  },
  levels = {
    ["smithing"] = 20
  },
  extra_prerequisites = {"rs-steel-bar", "rs-iron-armour"},
  icon = "__RsSmithing__/graphics/technology/steel-armour.png",
  icon_size = 800,
  localised_name = {"technology-name.rs-steel-armour"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(steel_pick_tech, true, true)

local mithril_pick_tech = {
  name = "rs-mithril-armour",
  recipes_to_unlock = {
    "rs-mithril-gauntlets",
    "rs-mithril-armoured-boots",
    "rs-mithril-full-helm",
    "rs-mithril-kiteshield",
    "rs-mithril-platelegs",
    "rs-mithril-platebody"
  },
  unit = {
    count = 75,
    time = 5
  },
  levels = {
    ["smithing"] = 30
  },
  extra_prerequisites = {"rs-mithril-bar", "rs-steel-armour"},
  icon = "__RsSmithing__/graphics/technology/mithril-armour.png",
  icon_size = 695,
  localised_name = {"technology-name.rs-mithril-armour"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(mithril_pick_tech, true)
local adamant_pick_tech = {
  name = "rs-adamant-armour",
  recipes_to_unlock = {
    "rs-adamant-gauntlets",
    "rs-adamant-armoured-boots",
    "rs-adamant-full-helm",
    "rs-adamant-kiteshield",
    "rs-adamant-platelegs",
    "rs-adamant-platebody"
  },
  unit = {
    count = 150,
    time = 5
  },
  levels = {
    ["smithing"] = 40
  },
  extra_prerequisites = {"rs-adamant-bar", "rs-mithril-armour"},
  icon = "__RsSmithing__/graphics/technology/adamant-armour.png",
  icon_size = 752,
  localised_name = {"technology-name.rs-adamant-armour"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(adamant_pick_tech, true)

local rune_pick_tech = {
  name = "rs-rune-armour",
  recipes_to_unlock = {
    "rs-rune-gauntlets",
    "rs-rune-armoured-boots",
    "rs-rune-full-helm",
    "rs-rune-kiteshield",
    "rs-rune-platelegs",
    "rs-rune-platebody"
  },
  unit = {
    count = 300,
    time = 5
  },
  levels = {
    ["smithing"] = 50
  },
  extra_prerequisites = {"rs-rune-bar", "rs-adamant-armour"},
  icon = "__RsSmithing__/graphics/technology/rune-armour.png",
  icon_size = 634,
  localised_name = {"technology-name.rs-rune-armour"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(rune_pick_tech, true)

local orikalkum_pick_tech = {
  name = "rs-orikalkum-armour",
  recipes_to_unlock = {
    "rs-orikalkum-gauntlets",
    "rs-orikalkum-armoured-boots",
    "rs-orikalkum-full-helm",
    "rs-orikalkum-kiteshield",
    "rs-orikalkum-platelegs",
    "rs-orikalkum-platebody"
  },
  unit = {
    count = 500,
    time = 5
  },
  levels = {
    ["smithing"] = 60
  },
  extra_prerequisites = {"rs-orikalkum-bar", "rs-rune-armour"},
  icon = "__RsSmithing__/graphics/technology/orikalkum-armour.png",
  icon_size = 670,
}
create_technology(orikalkum_pick_tech, true)

local necronium_pick_tech = {
  name = "rs-necronium-armour",
  recipes_to_unlock = {
    "rs-necronium-gauntlets",
    "rs-necronium-armoured-boots",
    "rs-necronium-full-helm",
    "rs-necronium-kiteshield",
    "rs-necronium-platelegs",
    "rs-necronium-platebody"
  },
  unit = {
    count = 750,
    time = 5
  },
  levels = {
    ["smithing"] = 70
  },
  extra_prerequisites = {"rs-necronium-bar", "rs-orikalkum-armour"},
  icon = "__RsSmithing__/graphics/technology/necronium-armour.png",
  icon_size = 600,
}
create_technology(necronium_pick_tech, true)

local bane_pick_tech = {
  name = "rs-bane-armour",
  recipes_to_unlock = {
    "rs-bane-gauntlets",
    "rs-bane-armoured-boots",
    "rs-bane-full-helm",
    "rs-bane-square-shield",
    "rs-bane-platelegs",
    "rs-bane-platebody"
  },
  unit = {
    count = 1000,
    time = 5
  },
  levels = {
    ["smithing"] = 80
  },prerequisites = {"rs-bane-bar", "rs-necronium-armour"},
  icon = "__RsSmithing__/graphics/technology/bane-armour.png",
  icon_size = 687,
}
create_technology(bane_pick_tech, true)

local elder_rune_pick_tech = {
  name = "rs-elder-rune-armour",
  recipes_to_unlock = {
    "rs-elder-rune-gauntlets",
    "rs-elder-rune-armoured-boots",
    "rs-elder-rune-full-helm",
    "rs-elder-rune-round-shield",
    "rs-elder-rune-platelegs",
    "rs-elder-rune-platebody"
  },
  unit = {
    count = 1500,
    time = 5
  },
  levels = {
    ["smithing"] = 90
  },
  extra_prerequisites = {"rs-elder-rune-bar", "rs-bane-armour"},
  icon = "__RsSmithing__/graphics/technology/elder-rune-armour.png",
  icon_size = 646,
}
create_technology(elder_rune_pick_tech, true)

