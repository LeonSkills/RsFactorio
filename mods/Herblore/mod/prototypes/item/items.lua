local items = require("scripts.item.auto_generated_items")
require("__RsBase__.scripts.prototypes")

for _, value in pairs(items) do
  if not value.flags then
    value.flags = {}
  end
  create_item(value)
end