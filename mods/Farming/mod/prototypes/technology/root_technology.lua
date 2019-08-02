require("__RsBase__.scripts.prototypes")

create_technology({
  name = "rs-oak-roots",
  recipes_to_unlock = {
    "rs-oak-roots"
  },
  unit = {
    count = 40,
    time = 15
  },
  levels = {
    ["farming"] = 15,
  },
  icon = "__RsFarming__/graphics/technology/oak-roots.png",
  icon_size = 450,
  extra_prerequisites = {"rs-oak-tree-patch"},
  localised_name = {"item-name.rs-oak-roots"}
})

create_technology({
  name = "rs-willow-roots",
  recipes_to_unlock = {
    "rs-willow-roots"
  },
  unit = {
    count = 250,
    time = 15
  },
  levels = {
    ["farming"] = 30,
  },
  icon = "__RsFarming__/graphics/technology/willow-roots.png",
  icon_size = 450,
  extra_prerequisites = {"rs-willow-tree-patch", "rs-oak-roots"},
  localised_name = {"item-name.rs-willow-roots"}
})

create_technology({
  name = "rs-maple-roots",
  recipes_to_unlock = {
    "rs-maple-roots"
  },
  unit = {
    count = 500,
    time = 15
  },
  levels = {
    ["farming"] = 45,
  },
  icon = "__RsFarming__/graphics/technology/maple-roots.png",
  icon_size = 450,
  extra_prerequisites = {"rs-maple-tree-patch", "rs-willow-roots"},
  localised_name = {"item-name.rs-maple-roots"}
})

create_technology({
  name = "rs-yew-roots",
  recipes_to_unlock = {
    "rs-yew-roots"
  },
  unit = {
    count = 750,
    time = 15
  },
  levels = {
    ["farming"] = 60,
  },
  icon = "__RsFarming__/graphics/technology/yew-roots.png",
  icon_size = 450,
  extra_prerequisites = {"rs-yew-tree-patch", "rs-maple-roots"},
  localised_name = {"item-name.rs-yew-roots"}
})

create_technology({
  name = "rs-magic-roots",
  recipes_to_unlock = {
    "rs-magic-roots"
  },
  unit = {
    count = 1000,
    time = 15
  },
  levels = {
    ["farming"] = 75,
  },
  icon = "__RsFarming__/graphics/technology/magic-roots.png",
  icon_size = 450,
  extra_prerequisites = {"rs-magic-tree-patch", "rs-yew-roots"},
  localised_name = {"item-name.rs-magic-roots"}
})