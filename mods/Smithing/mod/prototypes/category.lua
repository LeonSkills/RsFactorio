data:extend({
  {
    type = "recipe-category",
    name = "rs-smithing"
  }
})

table.insert(data.raw["god-controller"].default.crafting_categories, "rs-smithing")
table.insert(data.raw.character.character.crafting_categories, "rs-smithing")
