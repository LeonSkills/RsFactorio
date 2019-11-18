-- regular potion recipes

require("__RsBase__.scripts.prototypes")

local potions = require("__RsHerblore__.data.potion_data")
local comp_potion = require("__RsHerblore__.data.combination_potion_data")
local herbs = require("__RsFarming__.data.herb_data")

local prev_tech
for herb, herb_data in pairs(herbs) do
  local unf_potion = data.raw.item[get_vanilla_name("rs-"..herb.."-potion-(unf)")]
  local unf_fluid = data.raw.fluid[get_vanilla_name("rs-unfinished-"..herb)]
  create_technology({
    name = "rs-"..herb.."-processing",
    recipes_to_unlock = {
      "rs-clean-"..herb,
      unf_potion.name.."-fluid",
      unf_potion.name.."-item",
      unf_fluid.name.."-fluid",
      unf_fluid.name.."-item",
      "rs-vialing-"..herb,
      "rs-unvialing-"..herb,
    },
    unit = {
      count = (herb_data.level ^ 1.75)/5 + 20,
      time = 12
    },
    levels = {
      ["herblore"] = herb_data.level
    },
    icon = "__RsHerblore__/graphics/technology/clean_"..herb:gsub("-", "_")..".png",
    icon_size=512,
    extra_prerequisites = {prev_tech},
    localised_name = {"herb-processing",  {"herb.Rs-"..herb}},
    localised_description = {"herb-processing-description", {"herb.rs-"..herb}}
  })
  prev_tech = "rs-"..herb.."-processing"

  --remove cleaning from grimy tech
  local grimy_tech_effects = data.raw.technology[get_vanilla_name("rs-"..herb.."-farming")].effects
  for i, effect in pairs(grimy_tech_effects) do
    if effect.recipe == get_vanilla_name("rs-clean-"..herb) then
      grimy_tech_effects[i] = nil
      break
    end
  end
end

-- potions
for potion_name, potion_data in pairs(potions) do
  if potion_data.herb then
    local fact_name = get_vanilla_name("rs-".. potion_name)
    -- if the potion is a science pack then we create a new technology
    local herb_tech = data.raw.technology[get_vanilla_name("rs-"..potion_data.herb.."-processing")]
    if data.raw.tool[fact_name] then
      create_technology({
        name = fact_name,
        recipes_to_unlock = {
          fact_name
        },
        unit = {
          count = (potion_data.level ^ 1.8)/5 + 20,
          time = 12
        },
        levels = {
          ["herblore"] = potion_data.level
        },
        icon = "__RsHerblore__/graphics/technology/"..potion_name:gsub("-", "_")..".png",
        icon_size = 512,
        extra_prerequisites = {herb_tech.name},
        localised_description = data.raw.tool[fact_name].localised_description,
        localised_name = data.raw.tool[fact_name].localised_name
      })
    else
      table.insert(herb_tech.effects,{type = "unlock-recipe", recipe = fact_name})
      data.raw.recipe[fact_name].enabled = false
    end
  end
end

-- comp potions
for potion_name, potion_data in pairs(comp_potion) do
  local fact_name = get_vanilla_name("rs-"..potion_name)
  local prereqs = {}
  for _, extra_potion in pairs(potion_data.potions or {}) do
    local extra_potion_name = extra_potion[1]:gsub("rs-", "")
    local extra_potion_data = potions[extra_potion_name]
    if data.raw.technology[get_vanilla_name(extra_potion[1])] then
      table.insert(prereqs, get_vanilla_name(extra_potion[1]))
    elseif extra_potion_data and extra_potion_data.herb then
      table.insert(prereqs, get_vanilla_name("rs-"..extra_potion_data.."-processing"))
    end
  end
  create_technology({
    name = fact_name,
    recipes_to_unlock = {
      fact_name
    },
    unit = {
      count = (potion_data.level ^ 2)/5 + 20,
      time = 20
    },
    levels = {
      ["herblore"] = potion_data.level
    },
    icon = "__RsHerblore__/graphics/technology/"..potion_name:gsub("-", "_")..".png",
    icon_size = 256,
    extra_prerequisites = prereqs,
    localised_name = {"item-name.".. fact_name},
    localised_description = {"item-description."..fact_name}
  })
end