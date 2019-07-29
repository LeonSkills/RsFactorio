
require("__RsUtility__.scripts.prototypes")

create_item({
  name = "rs-compost-bin",
  subgroup = "rs-compost",
  order = "rs-001-compost-bin",
  stack_size = 20,
  icon = "__RsFarming__/graphics/icons/compost-bin.png",
  icon_size = 32
}, true)

create_recipe({
  name = "rs-compost-bin",
  category = "crafting",
  energy_required = 1.8,
  ingredients = {
    {"rs-plank", 20},
    {"rs-bronze-nails", 25}
  },
  results = {
    {"rs-compost-bin", 1}
  }
})

---- TODO, make this a different tier compost bin?
--create_recipe({
--  name = "rs-compost-bin",
--  order = "rs-002-compost-bin",
--  category = "crafting",
--  energy_required = 1.8,
--  ingredients = {
--    {"rs-oak-plank", 10},
--    {"rs-iron-nails", 25}
--  },
--  results = {
--    {"rs-compost-bin", 1}
--  }
--})

create_recipe({
  name = "rs-bucket",
  energy_required = 0.6,
  category = "crafting",
  ingredients = {
    {"rs-plank", 2}
  },
  results = {
    {"rs-bucket", 1}
  }
})
--
--local recipe = get_prototype("bucket-from-oak", "recipe")
--recipe.order = "rs-001-bucket-b"
--recipe.subgroup = "rs-farming-compost"
--recipe.ingredients = {{"oak-plank", 1}}
--recipe.energy_required = 0.5
--recipe.results = {{"bucket", 2}}

create_recipe({
  name = "rs-compost",
  energy_required = 15,
  category = "rs-compost",
  allow_decomposition = false,
  ingredients = {
    {name = "rs-bucket", amount = 15, catalyst_amount = 15}
  },
  results = {
    {name = "rs-compost", amount = 15, catalyst_amount = 15}
  }
})

create_recipe({
  name = "rs-supercompost",
  energy_required = 60,
  category = "rs-compost",
  allow_decomposition = false,
  ingredients = {
    {name = "rs-bucket", amount = 15, catalyst_amount = 15}
  },
  results = {
    {name = "rs-supercompost", amount = 15, catalyst_amount = 15}
  }
})

data:extend({
  {
    type = "fuel-category",
    name = "rs-compost"
  }
})
