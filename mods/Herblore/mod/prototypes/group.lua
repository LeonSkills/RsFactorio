
data:extend({
  {
    type = "item-group",
    name = "rs-herblore",
    order = "rs-051-herblore",
    icon = "__RsHerblore__/graphics/item-group/herblore.png",
    icon_size = 128
  },
  {
    type = "item-subgroup",
    name = "rs-regular-potions",
    order = "rs-herblore-020-regular-potions",
    group = "rs-herblore"
  },
  {
    type = "item-subgroup",
    name = "rs-combination-potions",
    order = "rs-herblore-021-regular-potions",
    group = "rs-herblore"
  },
  {
    type = "item-subgroup",
    name = "rs-herblore-secondaries",
    order = "rs-herblore-010-secondaries",
    group = "rs-herblore"
  },
  {
    type = "item-subgroup",
    name = "rs-herblore-items",
    order = "rs-herblore-000-herblore-items",
    group = "rs-herblore"
  },
  {
    type = "item-subgroup",
    name = "rs-unfinished-potions",
    order = "rs-herblore-007-unf",
    group = "rs-herblore"
  },
  {
    type = "item-subgroup",
    name = "rs-unfinished-fluids",
    order = "rs-herblore-006-unf",
    group = "rs-herblore"
  },
  {
    type = "item-subgroup",
    name = "rs-herblore-vialling",
    order = "rs-herblore-008-unf",
    group = "rs-herblore"
  },
  {
    type = "item-subgroup",
    name = "rs-herblore-unvialling",
    order = "rs-herblore-009-unf",
    group = "rs-herblore"
  }
})

-- move clean herbs to herblore
data.raw["item-subgroup"]["rs-clean-herbs"].group = "rs-herblore"
data.raw["item-subgroup"]["rs-clean-herbs"].order = "rs-herblore-005-clean-herbs"