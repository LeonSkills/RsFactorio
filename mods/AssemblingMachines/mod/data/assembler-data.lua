local assemblers = {
  [1] = {
    material = "bronze",
    speed = 0.25,
    based_on = 1,
    next_upgrade = "rs-steel-assembling-machine",
    module_slots = 0,
    ingredients = {{"rs-plank", 5}, {"rs-bronze-bar", 2}, {"rs-bronze-nails", 5}},
    drain = "0W",
    energy_consumption = "150kW",
    energy_type = "burner"
  },
  [2] = {
    material = "steel",
    speed = 0.5,
    based_on = 1,
    next_upgrade = "rs-adamant-assembling-machine",
    module_slots = 0,
    ingredients = {{"rs-oak-plank", 9}, {"rs-steel-bar", 9}, {"rs-iron-nails", 25}, {"electronic-circuit", 3}},
    drain = "2.5kW",
    energy_consumption = "75kW",
    tech_count = 30,
    level = 20,
    prerequisites = {"rs-oak-plank", "rs-steel-processing"}
  },
  [3] = {
    material = "adamant",
    speed = 0.75,
    based_on = 2,
    next_upgrade = "rs-rune-assembling-machine",
    module_slots = 2,
    ingredients = {{"rs-steel-assembling-machine", 1}, {"rs-willow-plank", 18}, {"rs-adamant-bar", 18}, {"rs-steel-nails", 40}, {"electronic-circuit", 6}},
    drain = "5kW",
    energy_consumption = "150kW",
    tech_count = 40,
    level = 40,
    prerequisites = {"rs-willow-plank", "rs-adamant-processing"}
  },
  [4] = {
    material = "rune",
    speed = 1.25,
    based_on = 2,
    next_upgrade = "rs-bane-assembling-machine",
    module_slots = 4,
    ingredients = {{"rs-adamant-assembling-machine", 2}, {"rs-maple-plank", 27}, {"rs-rune-bar", 36}, {"rs-mithril-nails", 100}, {"speed-module", 4}},
    drain = "12.5kW",
    energy_consumption = "375kW",
    tech_count = 150,
    level = 50,
    prerequisites = {"rs-maple-plank", "rs-rune-processing", "speed-module"}
  },
  [5] = {
    material = "bane",
    speed = 2,
    based_on = 3,
    next_upgrade = "rs-elder-rune-assembling-machine",
    module_slots = 6,
    ingredients = {{"rs-rune-assembling-machine", 2}, {"rs-yew-plank", 36}, {"rs-bane-bar", 72}, {"rs-adamant-nails", 150}, {"speed-module-2", 2}},
    drain = "40kW",
    energy_consumption = "1MW",
    tech_count = 500,
    level = 80,
    prerequisites = {"rs-yew-plank", "rs-bane-processing", "speed-module-2"}
  },
  [6] = {
    material = "elder-rune",
    speed = 2.5,
    based_on = 3,
    module_slots = 8,
    ingredients = {{"rs-bane-assembling-machine", 2}, {"rs-magic-plank", 90}, {"rs-elder-rune-bar", 72}, {"rs-rune-nails", 225}, {"speed-module-3", 1}},
    drain = "100kW",
    energy_consumption = "2.5MW",
    tech_count = 1500,
    level = 90,
    prerequisites = {"rs-magic-plank", "rs-elder-rune-processing", "speed-module-3"}
  }
}

return assemblers