require("__RsUtility__.scripts.prototypes")

create_technology({
  name = "rs-oak-tree-patch",
  recipes_to_unlock = {
    "rs-oak-tree-patch"
  },
  unit = {
    count = 20,
    time = 15
  },
  levels = {
    ["farming"] = 15,
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/oak-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/item-group/Farming.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256
})

create_technology({
  name = "rs-willow-tree-patch",
  recipes_to_unlock = {
    "rs-willow-tree-patch"
  },
  unit = {
    count = 100,
    time = 15
  },
  levels = {
    ["farming"] = 30,
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/willow-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/item-group/Farming.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-oak-tree-patch"}
})

create_technology({
  name = "rs-maple-tree-patch",
  recipes_to_unlock = {
    "rs-maple-tree-patch"
  },
  unit = {
    count = 200,
    time = 15
  },
  levels = {
    ["farming"] = 45,
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/maple-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/item-group/Farming.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-willow-tree-patch"}
})

create_technology({
  name = "rs-yew-tree-patch",
  recipes_to_unlock = {
    "rs-yew-tree-patch"
  },
  unit = {
    count = 300,
    time = 15
  },
  levels = {
    ["farming"] = 60,
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/yew-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/item-group/Farming.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-maple-tree-patch"}
})

create_technology({
  name = "rs-magic-tree-patch",
  recipes_to_unlock = {
    "rs-magic-tree-patch"
  },
  unit = {
    count = 500,
    time = 15
  },
  levels = {
    ["farming"] = 75,
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/magic-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/item-group/Farming.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-yew-tree-patch"}
})