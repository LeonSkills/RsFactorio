local function swap_flatpacks(flatpack_name, flatpack_count, entity_name, entity_count, player, items_to_keep)
  local min_items_to_keep = math.max(items_to_keep or 0, player.mod_settings["min-entity-items-to-keep"].value)
  local max_items_to_keep = math.max(items_to_keep or 0, player.mod_settings["max-entity-items-to-keep"].value)
  if min_items_to_keep > max_items_to_keep then
    min_items_to_keep = max_items_to_keep
  end
  if entity_count > max_items_to_keep then
    local items_to_change = entity_count - max_items_to_keep
    player.remove_item{name=entity_name, count=items_to_change}
    player.insert{name=flatpack_name, count=items_to_change}
  elseif entity_count < min_items_to_keep then
    local items_to_change = min_items_to_keep - entity_count
    if flatpack_count < 0 then
      flatpack_count = player.get_item_count(flatpack_name)
    end
    items_to_change = math.min(flatpack_count, items_to_change)
    if items_to_change > 0 then
      player.remove_item{name=flatpack_name, count=items_to_change}
      player.insert{name=entity_name, count=items_to_change}
    end
  end
end

local function on_build(event)
  local player = game.get_player(event.player_index)
  if player and player.valid and event.stack and event.stack.valid and event.stack.valid_for_read then
    if event.stack.name:sub(-6) == "entity" then
      local flatpack_name = event.stack.name:sub(1,-8)
      local entity_count = player.get_item_count(event.stack.name)
      swap_flatpacks(flatpack_name, -1, event.stack.name, entity_count, player, 1)
    end
  end
end

local function update_item_mappings()
  global.item_mappings = {}
  for k, v in pairs(game.get_filtered_item_prototypes{{filter="place-result"}}) do
    if k:sub(-6) == "entity" then
      global.item_mappings[k:sub(1, -8)] = true
    end
    if global.item_mappings[k] == nil then
      global.item_mappings[k] = false
    end
  end
end

local function on_inventory_changed(event)
  local player = game.get_player(event.player_index)
  if player and player.valid then
    for name, count in pairs(player.get_main_inventory().get_contents()) do
      if name:sub(-6) == "entity" then
        swap_flatpacks(name:sub(1,-8), -1, name, count, player)
      else
        if global.item_mappings[name] then
          local entity_count = player.get_item_count(name.."-entity")
          if entity_count == 0 then
            swap_flatpacks(name, count, name.."-entity", entity_count, player)
          end
        end
      end
    end
  end
end

local function on_player_pipette(event)
  local player = game.get_player(event.player_index)
  if player.mod_settings["min-entity-items-to-keep"].value == 0 then
    local name = event.item.name
    if player and player.valid and name:sub(-6) == "entity" then
      if player.get_item_count(name) == 0 and player.get_item_count(name:sub(1, -8)) > 1 then
        player.remove_item{name=name:sub(1, -8), count=1}
        player.insert{name=name, count=1}
        player.pipette_entity(name:sub(1, -8))
      end
    end
  end
end

local function on_init()
  update_item_mappings()
end

script.on_event(defines.events.on_built_entity, on_build)
script.on_event({defines.events.on_player_main_inventory_changed}, on_inventory_changed)
script.on_event({defines.events.on_player_pipette}, on_player_pipette)

script.on_init(on_init)
script.on_configuration_changed(update_item_mappings)