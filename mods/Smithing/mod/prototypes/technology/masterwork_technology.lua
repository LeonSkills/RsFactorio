require("__RsUtility__.scripts.prototypes")

local recipes_to_unlock = {
  "rs-concentrated-alloy-bar",
  "rs-enriched-alloy-bar",
  "rs-immaculate-alloy-bar",
  "rs-partially-folded-alloy-bar-0000",
  "rs-glorious-bar",
  "rs-masterwork-rivets",
  "rs-masterwork-plate",
  "rs-curved-masterwork-plate",
  "rs-untempered-masterwork-armour-piece",
  "rs-masterwork-armour-piece",
  "rs-lined-masterwork-armour-piece",
}


create_technology({
  name = "rs-masterwork-processing",
  recipes_to_unlock = recipes_to_unlock,
  unit = {
    count = 2500,
    time = 60
  },
  levels = {
    ["smithing"] = 99
  },
  extra_prerequisites = {"rs-elder-rune-processing"},
  icon = "__RsSmithing__/graphics/technology/masterwork-processing.png",
  icon_size = 391
})

recipes_to_unlock = {}

for piece, _ in pairs({boots=1, gloves=1, helm=2, platelegs=3, platebody=5}) do
  table.insert(recipes_to_unlock, "rs-unfinished-masterwork-"..piece)
  table.insert(recipes_to_unlock, "rs-unfinished-riveted-masterwork-"..piece)
  table.insert(recipes_to_unlock, "rs-masterwork-"..piece)
end
create_technology({
  name = "rs-masterwork-armour",
  recipes_to_unlock = recipes_to_unlock,
  unit = {
    count = 3000,
    time = 60
  },
  levels = {
    ["smithing"] = 99
  },
  extra_prerequisites = {"rs-elder-rune-armour", "rs-masterwork-processing"},
  icon = "__RsSmithing__/graphics/technology/masterwork-armour.png",
  icon_size = 128
})

create_technology({
  name = "rs-trimmed-masterwork-armour-set",
  recipes_to_unlock = {
    "rs-masterwork-armour-set"
  },
  unit = {
    count = 3500,
    time = 60
  },
  levels = {
    ["smithing"] = 99
  },
  extra_prerequisites = {"rs-masterwork-armour"},
  icon = "__RsSmithing__/graphics/technology/trimmed-masterwork-armour-set.png",
  icon_size = 1000,
  localised_name = {"item-name.rs-trimmed-masterwork-armour-set"}
})