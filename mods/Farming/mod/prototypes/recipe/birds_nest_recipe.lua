require("__RsBase__.scripts.prototypes")

create_recipe({
  name = "rs-empty-birds-nest",
  category = "crafting",
  energy_required = 0.6,
  ingredients = {
    {name = "rs-birds-nest", amount = 1}
  },
  results = {
    {name="rs-empty-birds-nest", amount=1},
    {name="rs-oak-seed", amount=1, probability = 1/2},
    {name="rs-willow-seed", amount=1, probability = 1/4},
    {name="rs-maple-seed", amount=1, probability = 1/8},
    {name="rs-yew-seed", amount=1, probability = 1/16},
    {name="rs-magic-seed", amount=1, probability = 1/32},
  },
  subgroup = "rs-farming-seeds",
  order = "rs-seeds-000-birds-nest",
  icon = "__RsFarming__/graphics/icons/birds-nest.png",
  icon_size = 32
})