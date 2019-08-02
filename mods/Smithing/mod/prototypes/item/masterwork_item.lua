require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")

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

create_item({
  name = "rs-masterwork-armour-set",
  stack_size = 1,
  icon = "__RsSmithing__/graphics/icons/masterwork-armour-set.png",
  icon_size = 32,
  subgroup = "rs-masterwork-armour-set",
  order = "rs-100-masterwork-armour-set",
  rocket_launch_product = {"rs-trimmed-masterwork-armour-set", 1000}
})

create_item({
  name = "rs-trimmed-masterwork-armour-set",
  stack_size = 2000,
  icon = "__RsSmithing__/graphics/icons/trimmed-masterwork-armour-set.png",
  icon_size = 32,
  subgroup = "rs-masterwork-armour-set",
  order = "rs-101-trimmed-masterwork-armour-set"
})