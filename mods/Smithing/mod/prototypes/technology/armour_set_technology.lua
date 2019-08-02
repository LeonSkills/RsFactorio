require("__RsBase__.scripts.prototypes")

local iron_pick_tech = {
  name = "rs-iron-armour-set",
  recipes_to_unlock = {
    "rs-iron-armour-set"
  },
  unit = {
    count = 10*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 10
  },
  extra_prerequisites = {"rs-iron-armour"},
  icon = "__RsSmithing__/graphics/technology/iron-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-iron-armour-set"}
}
create_technology(iron_pick_tech, true)

local steel_pick_tech = {
  name = "rs-steel-armour-set",
  recipes_to_unlock = {
    "rs-steel-armour-set"
  },
  unit = {
    count = 20*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 20
  },
  extra_prerequisites = {"rs-steel-armour", "rs-iron-armour-set"},
  icon = "__RsSmithing__/graphics/technology/steel-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-steel-armour-set"}
}
create_technology(steel_pick_tech, true, true)

local mithril_pick_tech = {
  name = "rs-mithril-armour-set",
  recipes_to_unlock = {
    "rs-mithril-armour-set"
  },
  unit = {
    count = 75*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 30
  },
  extra_prerequisites = {"rs-mithril-armour", "rs-steel-armour-set"},
  icon = "__RsSmithing__/graphics/technology/mithril-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-mithril-armour-set"}
}
create_technology(mithril_pick_tech, true)
local adamant_pick_tech = {
  name = "rs-adamant-armour-set",
  recipes_to_unlock = {
    "rs-adamant-armour-set"
  },
  unit = {
    count = 150*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 40
  },
  extra_prerequisites = {"rs-adamant-armour", "rs-mithril-armour-set"},
  icon = "__RsSmithing__/graphics/technology/adamant-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-adamant-armour-set"}
}
create_technology(adamant_pick_tech, true)

local rune_pick_tech = {
  name = "rs-rune-armour-set",
  recipes_to_unlock = {
    "rs-rune-armour-set"
  },
  unit = {
    count = 300*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 50
  },
  extra_prerequisites = {"rs-rune-armour", "rs-adamant-armour-set"},
  icon = "__RsSmithing__/graphics/technology/rune-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-rune-armour-set"}
}
create_technology(rune_pick_tech, true)

local orikalkum_pick_tech = {
  name = "rs-orikalkum-armour-set",
  recipes_to_unlock = {
    "rs-orikalkum-armour-set"
  },
  unit = {
    count = 500*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 60
  },
  extra_prerequisites = {"rs-orikalkum-armour", "rs-rune-armour-set"},
  icon = "__RsSmithing__/graphics/technology/orikalkum-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-orikalkum-armour-set"}
}
create_technology(orikalkum_pick_tech, true)

local necronium_pick_tech = {
  name = "rs-necronium-armour-set",
  recipes_to_unlock = {
    "rs-necronium-armour-set"
  },
  unit = {
    count = 750*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 70
  },
  extra_prerequisites = {"rs-necronium-armour", "rs-orikalkum-armour-set"},
  icon = "__RsSmithing__/graphics/technology/necronium-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-necronium-armour-set"}
}
create_technology(necronium_pick_tech, true)

local bane_pick_tech = {
  name = "rs-banite-armour-set",
  recipes_to_unlock = {
    "rs-banite-armour-set"
  },
  unit = {
    count = 1000,
    time = 5
  },
  levels = {
    ["smithing"] = 80
  },prerequisites = {"rs-bane-armour", "rs-necronium-armour-set"},
  icon = "__RsSmithing__/graphics/technology/banite-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-banite-armour-set"}
}
create_technology(bane_pick_tech, true)

local elder_rune_pick_tech = {
  name = "rs-elder-rune-armour-set",
  recipes_to_unlock = {
    "rs-elder-rune-armour-set"
  },
  unit = {
    count = 1500*1.5,
    time = 5
  },
  levels = {
    ["smithing"] = 90
  },
  extra_prerequisites = {"rs-elder-rune-armour", "rs-bane-armour-set"},
  icon = "__RsSmithing__/graphics/technology/elder-rune-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-elder-rune-armour-set"}
}
create_technology(elder_rune_pick_tech, true)

