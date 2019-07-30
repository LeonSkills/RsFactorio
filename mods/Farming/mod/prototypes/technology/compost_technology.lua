require("__RsUtility__.scripts.prototypes")

create_technology({
  name = "rs-supercompost",
  recipes_to_unlock = {
    "rs-supercompost"
  },
  unit = {
    count = 500,
    time = 15
  },
  levels = {
    ["farming"] = 60,
  },
  icon = "__RsFarming__/graphics/technology/supercompost.png",
  icon_size = 500
})
