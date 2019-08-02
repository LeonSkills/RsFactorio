require("__RsBase__.scripts.prototypes")

local bronze_bar = {
  name = "rs-bronze-bar",
  category = "smelting",
  ingredients = {
    {"rs-copper-ore", 1},
    {"rs-tin-ore", 1}
  },
  results = {
    {"rs-bronze-bar", 1}
  },
  overload_multiplier = 25,
  energy_required = 1.8,
  expensive = "nil",
  normal = "nil"
}
create_recipe(bronze_bar)

local iron_bar = {
  name = "rs-iron-bar",
  category = "smelting",
  ingredients = {
    {"rs-iron-ore", 1}
  },
  results = {
    {name="rs-iron-bar", amount=1, probability=0.5}
  },
  overload_multiplier = 50,
  energy_required = 3,
  expensive = "nil",
  normal = "nil"
}
create_recipe(iron_bar)


local steel_bar = {
  name = "rs-steel-bar",
  category = "smelting",
  ingredients = {
    {"rs-iron-ore", 1},
    {"rs-coal", 1}
  },
  results = {
    {name="rs-steel-bar", amount=1}
  },
  overload_multiplier = 25,
  energy_required = 4.2,
  expensive = "nil",
  normal = "nil"
}
create_recipe(steel_bar)

local mithril_bar = {
  name = "rs-mithril-bar",
  category = "smelting",
  ingredients = {
    {"rs-mithril-ore", 1},
    {"rs-coal", 1}
  },
  results = {
    {name="rs-mithril-bar", amount=1}
  },
  overload_multiplier = 20,
  energy_required = 6
}
create_recipe(mithril_bar)

local adamant_bar = {
  name = "rs-adamant-bar",
  category = "smelting",
  ingredients = {
    {"rs-adamantite-ore", 1},
    {"rs-luminite", 1}
  },
  results = {
    {name="rs-adamant-bar", amount=1}
  },
  overload_multiplier = 20,
  energy_required = 7.8
}
create_recipe(adamant_bar)

local rune_bar = {
  name = "rs-rune-bar",
  category = "smelting",
  ingredients = {
    {"rs-runite-ore", 1},
    {"rs-luminite", 1}
  },
  results = {
    {name="rs-rune-bar", amount=1}
  },
  overload_multiplier = 15,
  energy_required = 9.6
}
create_recipe(rune_bar)

local orikalkum_bar = {
  name = "rs-orikalkum-bar",
  category = "smelting",
  ingredients = {
    {"rs-orichalcite-ore", 1},
    {"rs-drakolith", 1}
  },
  results = {
    {name="rs-orikalkum-bar", amount=1}
  },
  overload_multiplier = 5,
  energy_required = 12
}
create_recipe(orikalkum_bar)

local necronium_bar = {
  name = "rs-necronium-bar",
  category = "smelting",
  ingredients = {
    {"rs-necrite-ore", 1},
    {"rs-phasmatite", 1}
  },
  results = {
    {name="rs-necronium-bar", amount=1}
  },
  overload_multiplier = 5,
  energy_required = 15
}
create_recipe(necronium_bar)

local bane_bar = {
  name = "rs-bane-bar",
  category = "smelting",
  ingredients = {
    {"rs-banite-ore", 2}
  },
  results = {
    {name="rs-bane-bar", amount=1}
  },
  overload_multiplier = 5,
  energy_required = 18
}
create_recipe(bane_bar)

local elder_rune_bar = {
  name = "rs-elder-rune-bar",
  category = "smelting",
  ingredients = {
    {"rs-rune-bar", 1},
    {"rs-light-animica", 1},
    {"rs-dark-animica", 1}
  },
  results = {
    {name="rs-elder-rune-bar", amount=1}
  },
  overload_multiplier = 5,
  energy_required = 24
}
create_recipe(elder_rune_bar)
