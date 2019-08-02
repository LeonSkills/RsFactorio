require("__RsBase__.scripts.prototypes")

for index, wood in pairs({"", "oak-", "willow-", "maple-", "yew-", "magic-"}) do
  create_recipe({
    name = "rs-"..wood.."plank",
    category = "crafting",
    energy_required = 0.6 * index + 0.6,
    ingredients = {
      {"rs-"..wood.."logs", 1 + index}
    },
    results = {
      {"rs-"..wood.."plank", 1}
    }
  })
end