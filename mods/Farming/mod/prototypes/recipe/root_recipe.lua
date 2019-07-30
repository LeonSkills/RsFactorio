require("__RsUtility__.scripts.prototypes")
local patch_data = require("data.patch_data")

for _, patch in pairs(patch_data) do
  create_recipe({
    name = "rs-"..patch.name.."-roots",
    category = get_vanilla_name("rs-"..patch.name.."-farming"),
    energy_required = patch.mining_time,
    ingredients = {
      {"rs-"..patch.name.."-seed", 1}
    },
    results = {
      {"rs-"..patch.name.."-roots", 5}
    }
  })
end
