require("__RsBase__.scripts.prototypes")
local science_packs = require("__RsBase__.data.science_packs")

local lab_item = {
  name = "rs-burner-lab",
  subgroup = "production-machine",
  order = "g[burner-lab]",
  place_result = "rs-burner-lab",
  stack_size = 10,
  icon = "__RsBase__/graphics/icons/burner_lab.png",
  icon_size = 32
}
create_item(lab_item)

local lab_recipe = {
  name = "rs-burner-lab",
  ingredients = {
    {"copper-plate", 10},
    {"wood", 10}
  },
  results = {
    {"rs-burner-lab", 1}
  },
  energy_required = 1.8
}
create_recipe(lab_recipe)


local lab = table.deepcopy(data.raw.lab.lab)

lab.name = "rs-burner-lab"
lab.energy_source = {
  type = "burner",
  usage_priority = "secondary-input",
  fuel_inventory_size = 1
}
lab.energy_usage = "50kW"
lab.inputs = {}
lab.minable.result = "rs-burner-lab"
lab.localised_name = {"item-name.rs-burner-lab"}

lab.light.color = {
  b = 0,
  g = 1,
  r = 1
}

lab.off_animation.layers[1].filename = "__RsBase__/graphics/entity/burner-lab/lab.png"
lab.off_animation.layers[1].hr_version.filename = "__RsBase__/graphics/entity/burner-lab/hr-lab.png"
lab.on_animation.layers[1].filename = "__RsBase__/graphics/entity/burner-lab/lab.png"
lab.on_animation.layers[1].hr_version.filename = "__RsBase__/graphics/entity/burner-lab/hr-lab.png"

data:extend({
  lab
})