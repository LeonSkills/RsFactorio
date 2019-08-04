
require("__RsBase__.scripts.prototypes")
local herbs = require("__RsFarming__.data.herb_data")
local colours = require("__RsBase__.data.colours")

for herb, herb_data in pairs(herbs) do
  local unf_potion = "rs-unfinished-"..herb
  local fluid = get_prototype(unf_potion, "fluid")
  fluid.default_temperature = 20
  fluid.max_temperature = 20
  fluid.base_color = colours[herb].unfinished
  fluid.flow_color = colours[herb].unfinished
  fluid.subgroup = "rs-unfinished-fluids"
  fluid.order = "rs-fluids-"..add_leading_zeros(herb_data.level, 3)
  fluid.icons = {
    {
      icon = "__RsHerblore__/graphics/icons/fluid-base.png",
      tint = colours[herb].unfinished,
      icon_size = 32
    }
  }
  fluid.icon_size = 32
end