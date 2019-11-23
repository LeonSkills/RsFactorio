data:extend({
  {
    type = "int-setting",
    name = "min-entity-items-to-keep",
    default_value = 1,
    minimum_value = 0,
    setting_type = "runtime-per-user",
    order = "[entity-keep]-a"
  },
  {
    type = "int-setting",
    name = "max-entity-items-to-keep",
    default_value = 1,
    minimum_value = 0,
    setting_type = "runtime-per-user",
    order = "[entity-keep]-b"
  }
})