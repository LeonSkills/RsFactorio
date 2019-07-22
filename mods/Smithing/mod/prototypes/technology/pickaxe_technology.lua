require("__RsUtility__.scripts.prototypes")

local iron_pick_tech = {
  name = "rs-iron-pickaxe",
  recipes_to_unlock = {
    "rs-iron-pickaxe"
  },
  unit = {
    count = 15,
    time = 10
  },
  levels = {
    ["mining"] = 10,
    ["smithing"] = 10
  },
  extra_prerequisites = {"rs-iron-bar"},
  icon = "__RsMining__/graphics/technology/iron-pickaxe.png",
  icon_size = 900
}
create_technology(iron_pick_tech, true)

local steel_pick_tech = {
  name = "rs-steel-pickaxe",
  recipes_to_unlock = {
    "rs-steel-pickaxe"
  },
  unit = {
    count = 50,
    time = 10
  },
  levels = {
    ["mining"] = 20,
    ["smithing"] = 20
  },
  extra_prerequisites = {"rs-steel-bar", "rs-iron-pickaxe"},
  icon = "__RsMining__/graphics/technology/steel-pickaxe.png",
  icon_size = 900
}
create_technology(steel_pick_tech, true)

local mithril_pick_tech = {
  name = "rs-mithril-pickaxe",
  recipes_to_unlock = {
    "rs-mithril-pickaxe"
  },
  unit = {
    count = 100,
    time = 10
  },
  levels = {
    ["mining"] = 30,
    ["smithing"] = 30
  },
  extra_prerequisites = {"rs-mithril-bar", "rs-steel-pickaxe"},
  icon = "__RsMining__/graphics/technology/mithril-pickaxe.png",
  icon_size = 900
}
create_technology(mithril_pick_tech, true)
local adamant_pick_tech = {
  name = "rs-adamant-pickaxe",
  recipes_to_unlock = {
    "rs-adamant-pickaxe"
  },
  unit = {
    count = 250,
    time = 10
  },
  levels = {
    ["mining"] = 40,
    ["smithing"] = 40
  },
  extra_prerequisites = {"rs-adamant-bar", "rs-mithril-pickaxe"},
  icon = "__RsMining__/graphics/technology/adamant-pickaxe.png",
  icon_size = 900
}
create_technology(adamant_pick_tech, true)

local rune_pick_tech = {
  name = "rs-rune-pickaxe",
  recipes_to_unlock = {
    "rs-rune-pickaxe"
  },
  unit = {
    count = 400,
    time = 10
  },
  levels = {
    ["mining"] = 50,
    ["smithing"] = 50
  },
  extra_prerequisites = {"rs-rune-bar", "rs-adamant-pickaxe"},
  icon = "__RsMining__/graphics/technology/rune-pickaxe.png",
  icon_size = 900
}
create_technology(rune_pick_tech, true)

local orikalkum_pick_tech = {
  name = "rs-orikalkum-pickaxe",
  recipes_to_unlock = {
    "rs-orikalkum-pickaxe"
  },
  unit = {
    count = 625,
    time = 10
  },
  levels = {
    ["mining"] = 60,
    ["smithing"] = 60
  },
  extra_prerequisites = {"rs-orikalkum-bar", "rs-rune-pickaxe"},
  icon = "__RsMining__/graphics/technology/orikalkum-pickaxe.png",
  icon_size = 900
}
create_technology(orikalkum_pick_tech, true)

local necronium_pick_tech = {
  name = "rs-necronium-pickaxe",
  recipes_to_unlock = {
    "rs-necronium-pickaxe"
  },
  unit = {
    count = 875,
    time = 10
  },
  levels = {
    ["mining"] = 70,
    ["smithing"] = 70
  },
  extra_prerequisites = {"rs-necronium-bar", "rs-orikalkum-pickaxe"},
  icon = "__RsMining__/graphics/technology/necronium-pickaxe.png",
  icon_size = 900
}
create_technology(necronium_pick_tech, true)

local bane_pick_tech = {
  name = "rs-bane-pickaxe",
  recipes_to_unlock = {
    "rs-bane-pickaxe"
  },
  unit = {
    count = 1250,
    time = 10
  },
  levels = {
    ["mining"] = 80,
    ["smithing"] = 80
  },
  extra_prerequisites = {"rs-bane-bar", "rs-necronium-pickaxe"},
  icon = "__RsMining__/graphics/technology/bane-pickaxe.png",
  icon_size = 900
}
create_technology(bane_pick_tech, true)

local elder_rune_pick_tech = {
  name = "rs-elder-rune-pickaxe",
  recipes_to_unlock = {
    "rs-elder-rune-pickaxe"
  },
  unit = {
    count = 2000,
    time = 10
  },
  levels = {
    ["mining"] = 90,
    ["smithing"] = 90
  },
  extra_prerequisites = {"rs-elder-rune-bar", "rs-bane-pickaxe"},
  icon = "__RsMining__/graphics/technology/elder-rune-pickaxe.png",
  icon_size = 900
}
create_technology(elder_rune_pick_tech, true)
