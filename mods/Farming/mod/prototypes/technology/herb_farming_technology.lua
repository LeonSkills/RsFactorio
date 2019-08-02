require("__RsBase__.scripts.prototypes")
require("__RsBase__.scripts.utility")
local herbs = require("__RsFarming__.data.herb_data")

local prev_tech

for herb, data in pairs(herbs) do
  local tech_name = "rs-"..herb.."-farming"
  
  local recipes_to_unlock = {
    tech_name
  }
  -- Is its own technology when Herblore is active
  if not mods["RsHerblore"] then
    table.insert(recipes_to_unlock, "rs-clean-"..herb)
  end

  create_technology({
    name =  tech_name,
    recipes_to_unlock = recipes_to_unlock,
    unit = {
      count = data.level ^ 1.75 + 20,
      time = 10
    },
    levels = {
      ["farming"] = data.level
    },
    icon = "__RsFarming__/graphics/technology/grimy_"..herb:gsub("-", "_")..".png",
    icon_size=512,
    extra_prerequisites = {prev_tech},
    localised_name = {"technology-name.rs-growing", {"item-name.rs-grimy-"..herb}},
    localised_description = {"technology-description.rs-growing", {"herb.rs-"..herb}}
  })

  create_technology({
    name =  tech_name.."-compost",
    recipes_to_unlock = {tech_name.."-compost"},
    unit = {
      count = (20 + data.level) ^ 1.75,
      time = 10
    },
    levels = {
      ["farming"] = data.level + 20
    },
    icons = {
      {
        icon =  "__RsFarming__/graphics/technology/grimy_"..herb:gsub("-", "_")..".png",
        scale = 0.5,
        icon_size = 512
      },
      {
        icon = "__RsFarming__/graphics/technology/compost.png",
        shift = {-128 + 59/2, 128 - 59/2},
        icon_size = 59
      }
    },
    icon_size=256,
    extra_prerequisites = {prev_tech and prev_tech.."-compost", tech_name},
    localised_name = {"technology-name.rs-compost-growing", {"item-name.rs-grimy-"..herb}},
    localised_description = {"technology-description.rs-compost-growing", {"herb.rs-"..herb}}
  })

  create_technology({
    name =  tech_name.."-supercompost",
    recipes_to_unlock = {tech_name.."-supercompost"},
    unit = {
      count = (40 + data.level) ^ 1.75,
      time = 10
    },
    levels = {
      ["farming"] = data.level + 40
    },
    icons = {
      {
        icon =  "__RsFarming__/graphics/technology/grimy_"..herb:gsub("-", "_")..".png",
        scale = 0.5,
        icon_size = 512
      },
      {
        icon = "__RsFarming__/graphics/technology/supercompost2.png",
        shift = {-128 + 59/2, 128 - 59/2},
        icon_size = 59
      }
    },
    icon_size=256,
    extra_prerequisites = {prev_tech and prev_tech.."-supercompost", tech_name.."-compost", "rs-supercompost"},
    localised_name = {"technology-name.rs-supercompost-growing", {"item-name.rs-grimy-"..herb}},
    localised_description = {"technology-description.rs-supercompost-growing", {"herb.rs-"..herb}}
  })
  
  
  prev_tech = tech_name
end