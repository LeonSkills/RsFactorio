require("__RsUtility__.scripts.prototypes")

local bronze_cable = {
  name = "rs-bronze-cable",
  stack_size = 200,
  icon = "__RsMining__/graphics/icons/bronze-cable.png",
  icon_size = 32,
  subgroup = "rs-mining-intermediate",
  order = "cable-01"
}

local adamant_cable = {
  name = "rs-adamant-cable",
  stack_size = 200,
  icon = "__RsMining__/graphics/icons/adamant-cable.png",
  icon_size = 32,
  subgroup = "rs-mining-intermediate",
  order = "cable-02"
}

local orikalkum_cable = {
  name = "rs-orikalkum-cable",
  stack_size = 200,
  icon = "__RsMining__/graphics/icons/orikalkum-cable.png",
  icon_size = 32,
  subgroup = "rs-mining-intermediate",
  order = "cable-03"
}

create_item(bronze_cable)
create_item(adamant_cable)
create_item(orikalkum_cable)