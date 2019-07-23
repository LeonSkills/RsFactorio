require("__RsUtility__.scripts.prototypes")
require("__RsUtility__.scripts.utility")


create_recipe({
  name = "rs-concentrated-alloy-bar",
  ingredients = {   
      {"rs-bronze-bar", 1},
      {"rs-iron-bar", 1},
      {"rs-steel-bar", 1},
      {"rs-mithril-bar", 1},
      {"rs-adamant-bar", 1},
      {"rs-rune-bar", 1},
      {"rs-orikalkum-bar", 1},
      {"rs-necronium-bar", 1},
      {"rs-bane-bar", 1},
      {"rs-elder-rune-bar", 1},
  },
  category = "smelting",
  energy_required = 4 * 0.6,
  results = {
    {"rs-concentrated-alloy-bar", 1}
  }
})

create_recipe({
  name = "rs-enriched-alloy-bar",
  category = "smelting",
  energy_required = 8 * 0.6,
  ingredients = {
    {"rs-concentrated-alloy-bar", 5}
  },
  results = {
    {"rs-enriched-alloy-bar", 1}
  },
})

create_recipe({
  name = "rs-immaculate-alloy-bar",
  category = "smelting",
  energy_required = 16*0.6,
  ingredients = {
    {"rs-enriched-alloy-bar", 10}
  },
  results = {
    {"rs-immaculate-alloy-bar", 1}
  }
})

create_recipe({
  name = "rs-partially-folded-alloy-bar-0000",
  category = "smelting",
  energy_required = 2 * 0.6,
  ingredients = {
    {"rs-immaculate-alloy-bar", 1}
  },
  results = {
    {"rs-partially-folded-alloy-bar-0000", 1}
  }
})

for i = 1, 1000 do
  create_recipe({
    name = "rs-partially-folded-alloy-bar-"..add_leading_zeros(i, 4),
    category = "rs-smithing",
    hidden = true,
    energy_required = 2 * 0.6,
    ingredients = {
      {"rs-partially-folded-alloy-bar-"..add_leading_zeros(i-1, 4), 1}
    },
    results = {
      { "rs-partially-folded-alloy-bar-"..add_leading_zeros(i, 4), 1}
    }
  })
end

create_recipe({
  name = "rs-glorious-bar",
  category = "rs-smithing",
  energy_required = 2 * 0.6,
  ingredients = {
    {"rs-partially-folded-alloy-bar-1000", 1}
  },
  results = {
    {"rs-glorious-bar", 1}
  }
})

create_recipe({
  name = "rs-masterwork-plate",
  category = "rs-smithing",
  energy_required = 100,
  ingredients = {
    {"rs-glorious-bar", 1}
  },
  results = {
    {"rs-masterwork-plate", 1}
  }
})

create_recipe({
  name = "rs-curved-masterwork-plate",
  category = "rs-smithing",
  energy_required = 100,
  ingredients = {
    {"rs-masterwork-plate", 1}
  },
  results = {
    {"rs-curved-masterwork-plate", 1}
  }
})

create_recipe({
  name = "rs-untempered-masterwork-armour-piece",
  category = "smelting",
  energy_required = 100,
  ingredients = {
    {"rs-curved-masterwork-plate", 1}
  },
  results = {
    {"rs-untempered-masterwork-armour-piece", 1}
  }
})

create_recipe({
  name = "rs-masterwork-armour-piece",
  category = "smelting",
  energy_required = 10,
  ingredients = {
    {"rs-untempered-masterwork-armour-piece", 1}
  },
  results = {
    {"rs-masterwork-armour-piece", 1}
  }
})

create_recipe({
  name = "rs-lined-masterwork-armour-piece",
  category = "crafting",
  energy_required = 1,
  ingredients = {
    {"rs-masterwork-armour-piece", 1},
    --{"rs-soft-leather", 1}
  },
  results = {
    {"rs-lined-masterwork-armour-piece", 1}
  }
})

create_recipe({
  name = "rs-masterwork-rivets",
  category = "rs-smithing",
  energy_required = 3 * 0.6,
  ingredients = {
    {"rs-steel-bar", 1}
  },
  results = {
    {"rs-masterwork-rivets", 10}
  }
})

for piece, bars in pairs({boots=1, gloves=1, helm=2, platelegs=3, platebody=5}) do
  create_recipe({
    name = "rs-unfinished-masterwork-"..piece,
    category = "smelting",
    energy_required = bars*16 * 0.6,
    ingredients = {
      {"rs-lined-masterwork-armour-piece", bars}
    },
    results = {
      {"rs-unfinished-masterwork-"..piece, 1}
    }
  })

  create_recipe({
    name = "rs-unfinished-riveted-masterwork-"..piece,
    category = "crafting",
    energy_required = bars * 3 * 0.6,
    ingredients = {
      {"rs-unfinished-masterwork-"..piece, 1},
      {"rs-masterwork-rivets", bars*10}
    },
    results = {
      {"rs-unfinished-riveted-masterwork-"..piece, 1}
    }
  })

  create_recipe({
    name = "rs-masterwork-"..piece,
    category = "rs-smithing",
    energy_required = bars * 1.2,
    ingredients = {
      {"rs-unfinished-riveted-masterwork-"..piece, 1},
    },
    results = {
      {"rs-masterwork-"..piece, 1}
    }
  })
end

create_recipe({
  name = "rs-masterwork-armour-set",
  category = "crafting",
  energy_required = 0.6 * 31 + 0.6,
  ingredients = {
    {"rs-masterwork-boots", 1},
    {"rs-masterwork-gloves", 1},
    {"rs-masterwork-helm", 1},
    {"rs-masterwork-platelegs", 1},
    {"rs-masterwork-platebody", 1}
  },
  results = {
    {"rs-masterwork-armour-set", 1}
  }
})