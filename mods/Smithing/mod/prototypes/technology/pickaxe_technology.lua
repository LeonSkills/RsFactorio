require("__RsBase__.scripts.prototypes")

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-iron-processing"},
  icon = "__RsSmithing__/graphics/technology/iron-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-iron-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(iron_pick_tech, true, true, true)

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-steel-processing", "rs-iron-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/steel-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-steel-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(steel_pick_tech, true, true, true)

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-mithril-processing", "rs-steel-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/mithril-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-mithril-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(mithril_pick_tech, true, true, true)
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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-adamant-processing", "rs-mithril-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/adamant-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-adamant-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(adamant_pick_tech, true, true, true)

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-rune-processing", "rs-adamant-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/rune-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-rune-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(rune_pick_tech, true, true, true)

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-orikalkum-processing", "rs-rune-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/orikalkum-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-orikalkum-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(orikalkum_pick_tech, true, true, true)

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-necronium-processing", "rs-orikalkum-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/necronium-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-necronium-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(necronium_pick_tech, true, true, true)

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-bane-processing", "rs-necronium-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/bane-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-bane-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(bane_pick_tech, true, true, true)

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
  extra_effects = {
    {
      type = "character-mining-speed",
      modifier = 0.5
    }
  },
  extra_prerequisites = {"rs-elder-rune-processing", "rs-bane-pickaxe"},
  icon = "__RsSmithing__/graphics/technology/elder-rune-pickaxe.png",
  icon_size = 900,
  localised_name = {"technology-name.rs-elder-rune-pickaxe"},
  localised_description = {"technology-description.steel-axe"}
}
create_technology(elder_rune_pick_tech, true, true, true)

