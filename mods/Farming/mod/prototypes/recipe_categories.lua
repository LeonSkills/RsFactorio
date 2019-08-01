
local trees = require("data.patch_data")

data:extend({
  {
    type = "recipe-category",
    name = "rs-compost"
  },
  {
    type = "recipe-category",
    name = "rs-herb-farming"
  }
})


for item_level, item_data in pairs(trees) do
  data:extend({
    {
      type = "recipe-category",
      name = "rs-"..item_data.name.."-farming"
    }
  })

end