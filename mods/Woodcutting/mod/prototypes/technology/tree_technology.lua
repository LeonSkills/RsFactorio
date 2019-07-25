require("__RsUtility__.scripts.prototypes")

create_technology({
  name = "rs-oak-tree",
  levels = {
    ["woodcutting"] = 15
  },
  unit = {
    count = 50,
    time = 120
  },
  extra_effects = {
    {
      type = "nothing",
      effect_description = {"technology-description.rs-oak-tree"}
    }
  },
  icon = "__RsWoodcutting__/graphics/technology/oak-tree.png",
  icon_size = 1050
})

create_technology({
  name = "rs-willow-tree",
  levels = {
    ["woodcutting"] = {2, 30}
  },
  unit = {
    count = 250,
    time = 120
  },
  extra_effects = {
    {
      type = "nothing",
      effect_description = {"technology-description.rs-willow-tree"}
    }
  },
  icon = "__RsWoodcutting__/graphics/technology/willow-tree.png",
  icon_size = 1050,
  extra_prerequisites = {"rs-oak-tree"}
})

create_technology({
  name = "rs-maple-tree",
  levels = {
    ["woodcutting"] = {2, 45}
  },
  unit = {
    count = 500,
    time = 120
  },
  extra_effects = {
    {
      type = "nothing",
      effect_description = {"technology-description.rs-maple-tree"}
    }
  },
  icon = "__RsWoodcutting__/graphics/technology/maple-tree.png",
  icon_size = 1050,
  extra_prerequisites = {"rs-willow-tree"}
})

create_technology({
  name = "rs-yew-tree",
  levels = {
    ["woodcutting"] = {2, 60}
  },
  unit = {
    count = 1000,
    time = 120
  },
  extra_effects = {
    {
      type = "nothing",
      effect_description = {"technology-description.rs-yew-tree"}
    }
  },
  icon = "__RsWoodcutting__/graphics/technology/yew-tree.png",
  icon_size = 1050,
  extra_prerequisites = {"rs-maple-tree"}
})

create_technology({
  name = "rs-magic-tree",
  levels = {
    ["woodcutting"] = {2, 75}
  },
  unit = {
    count = 2000,
    time = 120
  },
  extra_effects = {
    {
      type = "nothing",
      effect_description = {"technology-description.rs-magic-tree"}
    }
  },
  icon = "__RsWoodcutting__/graphics/technology/magic-tree.png",
  icon_size = 1050,
  extra_prerequisites = {"rs-yew-tree"}
})