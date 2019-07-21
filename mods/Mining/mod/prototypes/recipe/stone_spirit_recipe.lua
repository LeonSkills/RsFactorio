require("__RsUtility__.scripts.prototypes")

local bronze_spirit = {
  name = "rs-bronze-stone-spirit",
  ingredients = {
    {"rs-copper-ore", 1},
    {"rs-tin-ore", 1}
  },
  results = {
    {"rs-bronze-stone-spirit", 2}
  },
  energy_required = 2.4,
}
create_recipe(bronze_spirit)

local iron_spirit = {
  name = "rs-iron-stone-spirit",
  ingredients = {
    {"rs-iron-ore", 2},
  },
  results = {
    {"rs-iron-stone-spirit", 3}
  },
  energy_required = 3.6*3,
}
create_recipe(iron_spirit)


local steel_spirit = {
  name = "rs-steel-stone-spirit",
  ingredients = {
    {"rs-coal", 5},
  },
  results = {
    {"rs-steel-stone-spirit", 4}
  },
  energy_required = 4.8*4,
}
create_recipe(steel_spirit)

local mithril_spirit = {
  name = "rs-mithril-stone-spirit",
  ingredients = {
    {"rs-mithril-ore", 6}
  },
  results = {
    {"rs-mithril-stone-spirit", 7}
  },
  energy_required = 6*7,
}
create_recipe(mithril_spirit)

local adamantite_spirit = {
  name = "rs-adamantite-stone-spirit",
  ingredients = {
    {"rs-adamantite-ore", 3}
  },
  results = {
    {"rs-adamantite-stone-spirit", 2}
  },
  energy_required = 7.2 * 2,
}
create_recipe(adamantite_spirit)

local runite_spirit = {
  name = "rs-runite-stone-spirit",
  ingredients = {
    {"rs-runite-ore", 5}
  },
  results = {
    {"rs-runite-stone-spirit", 3}
  },
  energy_required = 8.4 * 3,
}
create_recipe(runite_spirit)

local orichalcite_spirit = {
  name = "rs-orichalcite-stone-spirit",
  ingredients = {
    {"rs-orichalcite-ore", 5}
  },
  results = {
    {"rs-orichalcite-stone-spirit", 4}
  },
  energy_required = 9.6 * 4,
}
create_recipe(orichalcite_spirit)

local necrite_spirit = {
  name = "rs-necrite-stone-spirit",
  ingredients = {
    {"rs-necrite-ore", 6}
  },
  results = {
    {"rs-necrite-stone-spirit", 5}
  },
  energy_required = 10.8 * 5,
}
create_recipe(necrite_spirit)


local banite_spirit = {
  name = "rs-banite-stone-spirit",
  ingredients = {
    {"rs-banite-ore", 7}
  },
  results = {
    {"rs-banite-stone-spirit", 6}
  },
  energy_required = 12 * 6,
}
create_recipe(banite_spirit)

local elder_rune_spirit = {
  name = "rs-elder-rune-stone-spirit",
  ingredients = {
    {"rs-light-animica", 2},
    {"rs-dark-animica", 2}
  },
  results = {
    {"rs-elder-rune-stone-spirit", 5}
  },
  energy_required = 15 * 5,
}
create_recipe(elder_rune_spirit)

