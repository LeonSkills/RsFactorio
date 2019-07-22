require("__RsUtility__.scripts.prototypes")

local iron_stone_spirit_tech = {
  name = "rs-iron-stone-spirit",
  recipes_to_unlock = {
    "rs-iron-stone-spirit"
  },
  unit = {
    count = 10,
    time = 5
  },
  levels = {
    ["mining"] = 10,
  },
  icon = "__RsMining__/graphics/technology/iron_ore.png",
  icon_size = 685,
  localised_name = {"item-name.rs-iron-ore"}
}
create_technology(iron_stone_spirit_tech, true)

local steel_stone_spirit_tech = {
  name = "rs-steel-stone-spirit",
  recipes_to_unlock = {
    "rs-steel-stone-spirit"
  },
  unit = {
    count = 20,
    time = 5
  },
  levels = {
    ["mining"] = 20,
  },
  icon = "__RsMining__/graphics/technology/coal.png",
  icon_size = 685,
  extra_prerequisites = {"rs-iron-stone-spirit"},
  localised_name = {"item-name.rs-coal"}
}
create_technology(steel_stone_spirit_tech, true)

local mithril_stone_spirit_tech = {
  name = "rs-mithril-stone-spirit",
  recipes_to_unlock = {
    "rs-mithril-stone-spirit"
  },
  unit = {
    count = 75,
    time = 5
  },
  levels = {
    ["mining"] = 30,
  },
  icon = "__RsMining__/graphics/technology/mithril_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-steel-stone-spirit"},
  localised_name = {"item-name.rs-mithril-ore"}
}
create_technology(mithril_stone_spirit_tech, true)

local adamantite_stone_spirit_tech = {
  name = "rs-adamantite-stone-spirit",
  recipes_to_unlock = {
    "rs-adamantite-stone-spirit"
  },
  unit = {
    count = 150,
    time = 5
  },
  levels = {
    ["mining"] = 40,
  },
  icon = "__RsMining__/graphics/technology/adamantite_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-mithril-stone-spirit"},
  localised_name = {"item-name.rs-adamantite-ore"}
}
create_technology(adamantite_stone_spirit_tech, true)


local runite_stone_spirit_tech = {
  name = "rs-runite-stone-spirit",
  recipes_to_unlock = {
    "rs-runite-stone-spirit"
  },
  unit = {
    count = 300,
    time = 5
  },
  levels = {
    ["mining"] = 50,
  },
  icon = "__RsMining__/graphics/technology/runite_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-adamantite-stone-spirit"},
  localised_name = {"item-name.rs-runite-ore"}
}
create_technology(runite_stone_spirit_tech, true)

local orichalcite_stone_spirit_tech = {
  name = "rs-orichalcite-stone-spirit",
  recipes_to_unlock = {
    "rs-orichalcite-stone-spirit"
  },
  unit = {
    count = 500,
    time = 5
  },
  levels = {
    ["mining"] = 60,
  },
  icon = "__RsMining__/graphics/technology/orichalcite_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-runite-stone-spirit"},
  localised_name = {"item-name.rs-orichalcite-ore"}
}
create_technology(orichalcite_stone_spirit_tech, true)


local necrite_stone_spirit_tech = {
  name = "rs-necrite-stone-spirit",
  recipes_to_unlock = {
    "rs-necrite-stone-spirit"
  },
  unit = {
    count = 750,
    time = 5
  },
  levels = {
    ["mining"] = 70,
  },
  icon = "__RsMining__/graphics/technology/necrite_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-orichalcite-stone-spirit"},
  localised_name = {"item-name.rs-necrite-ore"}
}
create_technology(necrite_stone_spirit_tech, true)

local banite_stone_spirit_tech = {
  name = "rs-banite-stone-spirit",
  recipes_to_unlock = {
    "rs-banite-stone-spirit"
  },
  unit = {
    count = 1000,
    time = 5
  },
  levels = {
    ["mining"] = 80,
  },
  icon = "__RsMining__/graphics/technology/banite_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-necrite-stone-spirit"},
  localised_name = {"item-name.rs-banite-ore"}
}
create_technology(banite_stone_spirit_tech, true)

local elder_rune_stone_spirit_tech = {
  name = "rs-elder-rune-stone-spirit",
  recipes_to_unlock = {
    "rs-elder-rune-stone-spirit"
  },
  unit = {
    count = 1500,
    time = 5
  },
  levels = {
    ["mining"] = 90,
  },
  icon = "__RsMining__/graphics/technology/elder_rune_ore.png",
  icon_size = 685,
  extra_prerequisites = {"rs-banite-stone-spirit"},
}
create_technology(elder_rune_stone_spirit_tech, true)


