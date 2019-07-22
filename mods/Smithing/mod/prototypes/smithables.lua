require("__RsSmithing__.utility.smithing_util")
local armours = require("__RsSmithing__.data.armour_data")

make_smithable("rs-bronze-cable", "rs-bronze-processing")
make_smithable("rs-adamant-cable", "rs-adamant-processing")
make_smithable("rs-orikalkum-cable", "rs-orikalkum-processing")
make_smithable("rs-bronze-nails", "rs-bronze-processing")
make_smithable("rs-iron-nails", "rs-iron-processing")
make_smithable("rs-steel-nails", "rs-steel-processing")
make_smithable("rs-mithril-nails", "rs-mithril-processing")
make_smithable("rs-adamant-nails", "rs-adamant-processing")
make_smithable("rs-rune-nails", "rs-rune-processing")

local mats = {"bronze", "iron", "steel", "mithril", "adamant", "rune", "orikalkum", "necronium", "bane", "elder-rune"}

for _, mat in pairs(mats) do
  make_smithable("rs-"..mat.."-pickaxe", "rs-"..mat.."-pickaxe")
end


for mat, data in pairs(armours) do
  local tech = "rs-"..mat.."-armour"
  make_smithable("rs-"..mat.."-gauntlets", tech)
  make_smithable("rs-"..mat.."-armoured-boots", tech)
  make_smithable("rs-"..mat.."-full-helm", tech)
  make_smithable("rs-"..mat.."-"..data.shield.."shield", tech)
  make_smithable("rs-"..mat.."-platelegs", tech)
  make_smithable("rs-"..mat.."-platebody", tech)
end