require("__RsUtility__.scripts.prototypes")

create_technology({
  name = "rs-oak-plank",
  levels = {
    ["woodcutting"] = 15
  },
  unit = {
    count = 50,
    time = 120
  },
  recipes_to_unlock = {
    "rs-oak-plank"
  },
  icon = "__RsWoodcutting__/graphics/technology/plank-maker.png",
  icon_size = 1000
})

create_technology({
  name = "rs-willow-plank",
  levels = {
    ["woodcutting"] = {2, 30}
  },
  unit = {
    count = 250,
    time = 120
  },
  recipes_to_unlock = {
    "rs-willow-plank"
  },
  icon = "__RsWoodcutting__/graphics/technology/plank-maker.png",
  icon_size = 1000,
  extra_prerequisites = {"rs-oak-plank"}
})

create_technology({
  name = "rs-maple-plank",
  levels = {
    ["woodcutting"] = {2, 45}
  },
  unit = {
    count = 500,
    time = 120
  },
  recipes_to_unlock = {
    "rs-maple-plank"
  },
  icon = "__RsWoodcutting__/graphics/technology/plank-maker.png",
  icon_size = 1000,
  extra_prerequisites = {"rs-willow-plank"}
})

create_technology({
  name = "rs-yew-plank",
  levels = {
    ["woodcutting"] = {2, 60}
  },
  unit = {
    count = 1000,
    time = 120
  },
  recipes_to_unlock = {
    "rs-yew-plank"
  },
  icon = "__RsWoodcutting__/graphics/technology/plank-maker.png",
  icon_size = 1000,
  extra_prerequisites = {"rs-maple-plank"}
})

create_technology({
  name = "rs-magic-plank",
  levels = {
    ["woodcutting"] = {2, 75}
  },
  unit = {
    count = 2000,
    time = 120
  },
  recipes_to_unlock = {
    "rs-magic-plank"
  },
  icon = "__RsWoodcutting__/graphics/technology/plank-maker.png",
  icon_size = 1000,
  extra_prerequisites = {"rs-yew-plank"}
})