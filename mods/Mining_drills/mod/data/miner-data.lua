-- does mining_power still work?
local miners = {
  bronze = {
    level = 1,
    based_on = "burner-mining-drill",
    next_upgrade = "rs-iron-mining-drill",
    mining_speed = 0.25,
    mining_power = 5,
    energy_usage = "150kW",
    energy_type = "burner",
    radius = 0.99,
    module_slots = 0,
    ingredients = {{"rs-bronze-pickaxe", 1}, {"rs-bronze-nails", 15}, {"stone-furnace", 1}},
    progress = 50
  },
  iron = {
    level = 10,
    based_on = "burner-mining-drill",
    next_upgrade = "rs-adamant-mining-drill",
    mining_speed = 0.5,
    mining_power = 10,
    mining_power = 10,
    energy_usage = "450kW",
    energy_type = "burner",
    radius = 0.99,
    module_slots = 1,
    ingredients = {{"burner-mining-drill", 1}, {"rs-bronze-nails", 25}, {"rs-iron-pickaxe", 1}},
    progress = 100
  },
  steel = {
    level = 20,
    based_on = "electric-mining-drill",
    next_upgrade = "rs-mithril-mining-drill",
    mining_speed = 1,
    mining_power = 20,
    energy_usage = "90kW",
    energy_type = "electric",
    radius = 1.49,
    module_slots = 1,
    ingredients = {{"electronic-circuit", 10}, {"rs-iron-nails", 40}, {"rs-steel-pickaxe", 2}},
    progress = 150
  },
  mithril = {
    level = 30,
    based_on = "electric-mining-drill",
    next_upgrade = "rs-rune-mining-drill",
    mining_speed = 2,
    mining_power = 30,
    energy_usage = "200kW",
    energy_type = "electric",
    radius = 2.49,
    module_slots = 2,
    ingredients = {{"electric-mining-drill", 1}, {"electronic-circuit", 15}, {"rs-iron-nails", 50}, {"rs-mithril-pickaxe", 3}},
    progress = 200
  },
  adamant = {
    level = 40,
    based_on = "burner-mining-drill",
    next_upgrade = "rs-orikalkum-mining-drill",
    mining_speed = 3,
    mining_power = 40,
    energy_usage = "1000kW",
    energy_type = "burner",
    radius = 1.99,
    module_slots = 2,
    ingredients = {{"rs-iron-mining-drill", 1}, {"rs-steel-nails", 75}, {"rs-adamant-pickaxe", 5}},
    progress = 250
  },
  rune = {
    level = 50,
    based_on = "electric-mining-drill",
    next_upgrade = "rs-necronium-mining-drill",
    mining_speed = 4,
    mining_power = 50,
    energy_usage = "450kW",
    energy_type = "electric",
    radius = 2.49,
    module_slots = 3,
    ingredients = {{"rs-mithril-mining-drill", 1}, {"advanced-circuit", 10}, {"rs-steel-nails", 100}, {"rs-rune-pickaxe", 10}},
    progress = 300
  },
  orikalkum = {
    level = 60,
    based_on = "burner-mining-drill",
    next_upgrade = "rs-elder-rune-mining-drill",
    mining_speed = 5,
    mining_power = 60,
    energy_usage = "2000kW",
    energy_type = "burner",
    radius = 2.99,
    module_slots = 4,
    ingredients = {{"rs-adamant-mining-drill", 1}, {"rs-mithril-nails", 125}, {"rs-orikalkum-pickaxe", 15}},
    progress = 350
  },
  necronium = {
    level = 70,
    based_on = "electric-mining-drill",
    next_upgrade = "rs-bane-mining-drill",
    mining_speed = 6,
    mining_power = 70,
    energy_usage = "800kW",
    energy_type = "electric",
    radius = 3.49,
    module_slots = 5,
    ingredients = {{"rs-rune-mining-drill", 1}, {"advanced-circuit", 20}, {"rs-mithril-nails", 150}, {"rs-necronium-pickaxe", 20}},
    progress = 400
  },
  bane = {
    level = 80,
    based_on = "electric-mining-drill",
    next_upgrade = nil,
    mining_speed = 7,
    mining_power = 80,
    energy_usage = "810kW",
    energy_type = "electric",
    radius = 4.49,
    module_slots = 6,
    ingredients = {{"rs-necronium-mining-drill", 1}, {"processing-unit", 10}, {"rs-adamant-nails", 175}, {"rs-bane-pickaxe", 25}},
    progress = 450
  },
  ["elder-rune"] = {
    level = 90,
    based_on = "burner-mining-drill",
    next_upgrade = nil,
    mining_speed = 8,
    mining_power = 90,
    energy_usage = "3500kW",
    energy_type = "burner",
    radius = 3.99,
    module_slots = 6,
    ingredients = {{"rs-orikalkum-mining-drill", 1}, {"rs-rune-nails", 200}, {"rs-elder-rune-pickaxe", 30}},
    progress = 500
  },
}

return miners