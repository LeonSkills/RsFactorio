require("__RsUtility__.scripts.prototypes")

if not mods["RsWoodcutting"] then return end

create_technology({
  name = "rs-oak-growing",
  recipes_to_unlock = {
    "rs-oak-growing"
  },
  unit = {
    count = 40,
    time = 15
  },
  levels = {
    ["farming"] = 15,
    ["woodcutting"] = 15
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/oak-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/oak-logs.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-oak-tree-patch"},
  localized_name = {"recipe-name.rs-oak-growing"}
})

create_technology({
  name = "rs-willow-growing",
  recipes_to_unlock = {
    "rs-willow-growing"
  },
  unit = {
    count = 100,
    time = 15
  },
  levels = {
    ["farming"] = 30,
    ["woodcutting"] = 30
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/willow-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/willow-logs.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-oak-growing", "rs-willow-tree-patch"},
  localized_name = {"recipe-name.rs-willow-growing"}
})

create_technology({
  name = "rs-maple-growing",
  recipes_to_unlock = {
    "rs-maple-growing"
  },
  unit = {
    count = 200,
    time = 15
  },
  levels = {
    ["farming"] = 45,
    ["woodcutting"] = 45
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/maple-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/maple-logs.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-willow-growing", "rs-maple-tree-patch"},
  localized_name = {"recipe-name.rs-maple-growing"}
})

create_technology({
  name = "rs-yew-growing",
  recipes_to_unlock = {
    "rs-yew-growing"
  },
  unit = {
    count = 300,
    time = 15
  },
  levels = {
    ["farming"] = 60,
    ["woodcutting"] = 60
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/yew-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/yew-logs.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-maple-growing", "rs-yew-tree-patch"},
  localized_name = {"recipe-name.rs-yew-growing"}
})

create_technology({
  name = "rs-magic-growing",
  recipes_to_unlock = {
    "rs-magic-growing"
  },
  unit = {
    count = 500,
    time = 15
  },
  levels = {
    ["farming"] = 75,
    ["woodcutting"] = 75
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/magic-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/magic-logs.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-yew-growing", "rs-magic-tree-patch"},
  localized_name = {"recipe-name.rs-magic-growing"}
})


-- compost
create_technology({
  name = "rs-oak-growing-compost",
  recipes_to_unlock = {
    "rs-oak-growing-compost"
  },
  unit = {
    count = 200,
    time = 15
  },
  levels = {
    ["farming"] = 30,
    ["woodcutting"] = 30
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/oak-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/compost.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-oak-growing"},
  localized_name = {"recipe-name.rs-oak-growing-compost"}
})

create_technology({
  name = "rs-willow-growing-compost",
  recipes_to_unlock = {
    "rs-willow-growing-compost"
  },
  unit = {
    count = 400,
    time = 15
  },
  levels = {
    ["farming"] = 45,
    ["woodcutting"] = 45
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/willow-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/compost.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-oak-growing-compost", "rs-willow-growing"},
  localized_name = {"recipe-name.rs-willow-growing-compost"}
})

create_technology({
  name = "rs-maple-growing-compost",
  recipes_to_unlock = {
    "rs-maple-growing-compost"
  },
  unit = {
    count = 800,
    time = 15
  },
  levels = {
    ["farming"] = 60,
    ["woodcutting"] = 60
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/maple-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/compost.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-willow-growing-compost", "rs-maple-growing"},
  localized_name = {"recipe-name.rs-maple-growing-compost"}
})

create_technology({
  name = "rs-yew-growing-compost",
  recipes_to_unlock = {
    "rs-yew-growing-compost"
  },
  unit = {
    count = 1200,
    time = 15
  },
  levels = {
    ["farming"] = 75,
    ["woodcutting"] = 75
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/yew-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/compost.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-maple-growing-compost", "rs-yew-growing"},
  localized_name = {"recipe-name.rs-yew-growing-compost"}
})

create_technology({
  name = "rs-magic-growing-compost",
  recipes_to_unlock = {
    "rs-magic-growing-compost"
  },
  unit = {
    count = 2000,
    time = 15
  },
  levels = {
    ["farming"] = 90,
    ["woodcutting"] = 90
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/magic-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/compost.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-yew-growing-compost", "rs-magic-growing"},
  localized_name = {"recipe-name.rs-magic-growing-compost"}
})


-- supercompost
create_technology({
  name = "rs-oak-growing-supercompost",
  recipes_to_unlock = {
    "rs-oak-growing-supercompost"
  },
  unit = {
    count = 800,
    time = 15
  },
  levels = {
    ["farming"] = 45,
    ["woodcutting"] = 45
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/oak-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/supercompost2.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-oak-growing-compost", "rs-supercompost"},
  localized_name = {"recipe-name.rs-oak-growing-supercompost"}
})

create_technology({
  name = "rs-willow-growing-supercompost",
  recipes_to_unlock = {
    "rs-willow-growing-supercompost"
  },
  unit = {
    count = 2000,
    time = 15
  },
  levels = {
    ["farming"] = 60,
    ["woodcutting"] = 60
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/willow-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/supercompost2.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-oak-growing-supercompost", "rs-willow-growing-compost", "rs-supercompost"},
  localized_name = {"recipe-name.rs-willow-growing-supercompost"}
})

create_technology({
  name = "rs-maple-growing-supercompost",
  recipes_to_unlock = {
    "rs-maple-growing-supercompost"
  },
  unit = {
    count = 2400,
    time = 15
  },
  levels = {
    ["farming"] = 75,
    ["woodcutting"] = 75
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/maple-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/supercompost2.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-willow-growing-supercompost", "rs-maple-growing-compost", "rs-supercompost"},
  localized_name = {"recipe-name.rs-maple-growing-supercompost"}
})

create_technology({
  name = "rs-yew-growing-supercompost",
  recipes_to_unlock = {
    "rs-yew-growing-supercompost"
  },
  unit = {
    count = 4800,
    time = 15
  },
  levels = {
    ["farming"] = 90,
    ["woodcutting"] = 90
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/yew-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/supercompost2.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-maple-growing-supercompost", "rs-yew-growing-compost", "rs-supercompost"},
  localized_name = {"recipe-name.rs-yew-growing-supercompost"}
})

create_technology({
  name = "rs-magic-growing-supercompost",
  recipes_to_unlock = {
    "rs-magic-growing-supercompost"
  },
  unit = {
    count = 8000,
    time = 15
  },
  levels = {
    ["farming"] = 105,
    ["woodcutting"] = 105
  },
  icons = {
    {
      icon = "__RsFarming__/graphics/technology/magic-tree.png",
      icon_size = 256
    },
    {
      icon = "__RsFarming__/graphics/technology/supercompost2.png",
      shift = {-128 + 59/2, 128 - 59/2},
      icon_size = 59
    }
  },
  icon_size = 256,
  extra_prerequisites = {"rs-yew-growing-supercompost", "rs-magic-growing-compost", "rs-supercompost"},
  localized_name = {"recipe-name.rs-magic-growing-supercompost"}
})