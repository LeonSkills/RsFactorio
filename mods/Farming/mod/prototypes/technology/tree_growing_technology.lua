require("__RsBase__.scripts.prototypes")

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
  extra_prerequisites = {"rs-oak-tree-patch", "rs-oak-tree"},
  localised_name = {"item-name.rs-oak-logs"},
  localised_description = {"technology-description.rs-growing", {"tree.rs-oak-tree"}}
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
  extra_prerequisites = {"rs-oak-growing", "rs-willow-tree-patch", "rs-willow-tree"},
  localised_name = {"item-name.rs-willow-logs"},
  localised_description = {"technology-description.rs-growing", {"tree.rs-willow-tree"}}
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
  extra_prerequisites = {"rs-willow-growing", "rs-maple-tree-patch", "rs-maple-tree"},
  localised_name = {"item-name.rs-maple-logs"},
  localised_description = {"technology-description.rs-growing", {"tree.rs-maple-tree"}}
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
  extra_prerequisites = {"rs-maple-growing", "rs-yew-tree-patch", "rs-yew-tree"},
  localised_name = {"item-name.rs-yew-logs"},
  localised_description = {"technology-description.rs-growing", {"tree.rs-yew-tree"}}
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
  extra_prerequisites = {"rs-yew-growing", "rs-magic-tree-patch", "rs-magic-tree"},
  localised_name = {"item-name.rs-magic-logs"},
  localised_description = {"technology-description.rs-growing", {"tree.rs-magic-tree"}}
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
  localised_name = {"technology-name.rs-compost-growing", {"item-name.rs-oak-logs"}},
  localised_description = {"technology-description.rs-compost-growing", {"tree.rs-oak-tree"}}
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
  localised_name = {"technology-name.rs-compost-growing", {"item-name.rs-willow-logs"}},
  localised_description = {"technology-description.rs-compost-growing", {"tree.rs-willow-tree"}}
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
  localised_name = {"technology-name.rs-compost-growing", {"item-name.rs-maple-logs"}},
  localised_description = {"technology-description.rs-compost-growing", {"tree.rs-maple-tree"}}
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
  localised_name = {"technology-name.rs-compost-growing", {"item-name.rs-yew-logs"}},
  localised_description = {"technology-description.rs-compost-growing", {"tree.rs-yew-tree"}}
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
  localised_name = {"technology-name.rs-compost-growing", {"item-name.rs-magic-logs"}},
  localised_description = {"technology-description.rs-compost-growing", {"tree.rs-magic-tree"}}
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
  localised_name = {"technology-name.rs-supercompost-growing", {"item-name.rs-oak-logs"}},
  localised_description = {"technology-description.rs-supercompost-growing", {"tree.rs-oak-tree"}}
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
  localised_name = {"technology-name.rs-supercompost-growing", {"item-name.rs-willow-logs"}},
  localised_description = {"technology-description.rs-supercompost-growing", {"tree.rs-willow-tree"}}
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
  localised_name = {"technology-name.rs-supercompost-growing", {"item-name.rs-maple-logs"}},
  localised_description = {"technology-description.rs-supercompost-growing", {"tree.rs-maple-tree"}}
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
  localised_name = {"technology-name.rs-supercompost-growing", {"item-name.rs-yew-logs"}},
  localised_description = {"technology-description.rs-supercompost-growing", {"tree.rs-yew-tree"}}
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
  localised_name = {"technology-name.rs-supercompost-growing", {"item-name.rs-magic-logs"}},
  localised_description = {"technology-description.rs-supercompost-growing", {"tree.rs-magic-tree"}}
})