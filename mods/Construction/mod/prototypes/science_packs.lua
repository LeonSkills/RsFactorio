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

local function create_science_pack(name, ingredients, energy, result_count, order, technology, cost, time, levels, prereqs)
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
  if technology then
    local tech = get_prototype(name, "technology")
    tech.icon = pack.icon
    tech.icon_size = pack.icon_size
    tech.recipes_to_unlock = {
      recipe.name
    }
    tech.unit = {
      count = cost,
      time = time
    }
    tech.levels = levels
    tech.extra_prerequisites = prereqs
    tech.localised_name = {"item-name."..name}
    create_technology(tech, false, false, false)
  end
end

create_science_pack("rs-burner-flatpack",{{"burner-inserter", 1}, {"burner-mining-drill", 1}}, 3, 1, "a")
create_science_pack("rs-logistic-flatpack", {{"transport-belt", 1}, {"inserter", 1}}, 6, 1, "b", true, 75, 5, {["construction"] = 19}, {"logistics"})
create_science_pack("rs-military-flatpack", {{"gun-turret", 1}, {"radar", 1}}, 15, 2, "c", true, 30, 15, {["construction"] = 29}, {"turrets"})
create_science_pack("rs-chemical-flatpack", {{"chemical-plant", 1}, {"pump", 1}}, 12, 1, "d", true, 75, 10, {["construction"] = 49}, {"fluid-handling", "oil-processing"})
create_science_pack("rs-advanced-electric-flatpack", {{"electric-furnace", 1}, {"substation", 1}}, 21, 3, "e", true, 100, 30, {["construction"] = 69}, {"advanced-material-processing-2", "electric-energy-distribution-2"})
create_science_pack("rs-utility-flatpack", {{"beacon", 1}, {"roboport", 1}}, 30, 20, "f", true, 100, 30, {["construction"] = 89}, {"effect-transmission"})
create_science_pack("rs-rocket-flatpack", {{"rocket-silo", 1}}, 256, 40, "g", true, 2000, 30, {["construction"] = 99}, {"rocket-silo"})