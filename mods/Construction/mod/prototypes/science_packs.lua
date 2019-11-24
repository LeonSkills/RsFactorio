-- Burner inserter, burner mining drill
-- Transport belt, inserter
-- Turret, radar
-- Chemical plant, pump
-- Electric Furnace, substation
-- Beacon, roboport
-- Rocket silo
require("__RsBase__.scripts.prototypes")

data:extend({
  {
    type = "item-subgroup",
    name = "construction-science-pack",
    group = "rs-construction",
    order = "construction-science-pack",
  }
})

local function create_science_pack(name, ingredients, energy, result_count, order, technology)
  local pack = {
    type = "tool",
    name = name,
    icon = "__RsConstruction__/graphics/icons/"..name..".png",
    icon_size = 64,
    localised_description = {
      "item-description.science-pack"
    },
    order = "science-pack-"..order,
    stack_size = 200,
    subgroup = "construction-science-pack"
  }
  create_item(pack)
  local recipe = {
    type = "recipe",
    name = name,
    enabled = technology == nil,
    energy_required = energy,
    ingredients = ingredients,
    result = name,
    result_count = result_count
  }
  data:extend({recipe})
end

create_science_pack("rs-burner-flatpack",{{"burner-inserter", 1}, {"burner-mining-drill", 1}}, 3, 1, "a")
create_science_pack("rs-logistic-flatpack", {{"transport-belt", 1}, {"inserter", 1}}, 6, 1, "b", true)
create_science_pack("rs-military-flatpack", {{"gun-turret", 1}, {"radar", 1}}, 15, 2, "c", true)
create_science_pack("rs-chemical-flatpack", {{"chemical-plant", 1}, {"pump", 1}}, 12, 1, "d", true)
create_science_pack("rs-advanced-electric-flatpack", {{"electric-furnace", 1}, {"substation", 1}}, 21, 3, "e", true)
create_science_pack("rs-utility-flatpack", {{"beacon", 1}, {"roboport", 1}}, 30, 5, "f", true)
create_science_pack("rs-rocket-flatpack", {{"rocket-silo", 1}}, 256, 40, "g", true)