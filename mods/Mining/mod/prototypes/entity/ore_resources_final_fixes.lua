local ores = require("prototypes.entity.ore_data")
require("__RsUtility__.scripts.prototypes")

-- update presets
for _, preset in pairs(data.raw["map-gen-presets"].default) do
  if preset.basic_settings ~= nil and preset.basic_settings.autoplace_controls ~= nil then
    local controls = preset.basic_settings.autoplace_controls["coal"]
    for ore_name, _ in pairs(ores) do
      local factorio_name = get_vanilla_name("rs-"..ore_name)
      preset.basic_settings.autoplace_controls[factorio_name] = preset.basic_settings.autoplace_controls[factorio_name] or table.deepcopy(controls)
    end
  end
end
