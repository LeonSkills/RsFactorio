require("__RsUtility__.scripts.prototypes")
require("__RsUtility__.scripts.utility")

--folded bars
create_item({
  name = "rs-partially-folded-alloy-bar-"..add_leading_zeros(0, 4),
  stack_size = 100,
  icon = "__RsSmithing__/graphics/icons/partially-folded-alloy-bar.png",
  icon_size = 32,
  subgroup = "rs-alloy-bars",
  order = "rs-013-partially-folded-"..add_leading_zeros(0, 4)
})
for i = 1, 1000 do
  create_item({
    name = "rs-partially-folded-alloy-bar-"..add_leading_zeros(i, 4),
    stack_size = 100,
    localised_name = { "item-name.rs-folded-alloy-bar", i},
    localised_description = { "item-description.rs-partially-folded-alloy-bar", i},
    icon = "__RsSmithing__/graphics/icons/partially-folded-alloy-bar.png",
    icon_size = 32,
    subgroup = "rs-alloy-bars",
    order = "rs-013-partially-folded-"..add_leading_zeros(i, 4),
    flags = {"hidden"}
  })
end