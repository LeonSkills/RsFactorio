require("__RsBase__.scripts.prototypes")

-- make trees not minable when research hasn't been unlocked yet
script.on_event(defines.events.on_chunk_charted, function(event)
  local surface = game.get_surface(event.surface_index)
  local chunk = event.position
  local left_top_position = {x = chunk.x * 32, y = chunk.y * 32}
  local right_bottom_position = {x = left_top_position.x + 32, y = left_top_position.y + 32}
  local area = {left_top_position = left_top_position, right_bottom_position = right_bottom_position}
  local trees = { "oak", "willow", "maple", "yew", "magic"}
  local locked_trees = {}
  for _, tree_name in pairs(trees) do
    if not event.force.technologies[get_vanilla_name("rs-"..tree_name.."-tree")].researched then
      table.insert(locked_trees, get_vanilla_name("rs-".. tree_name .."-tree"))
    end
  end
  if #locked_trees > 0 then
    local tree_proto_name = surface.find_entities_filtered({
      area = area,
      surface = surface,
      name = locked_trees
    })
    for _, tree in pairs(tree_proto_name) do
      tree.minable = false
    end
  end
end)

-- make trees minable once technology is researched
script.on_event(defines.events.on_research_finished, function(event)
  local trees = { "oak", "willow", "maple", "yew", "magic"}
  for _, tree_name in pairs(trees) do
    if event.research.name == get_vanilla_name("rs-".. tree_name .."-tree") then
      for i, surface in pairs(game.surfaces) do
        local tree_proto_name = surface.find_entities_filtered({
          name = get_vanilla_name("rs-".. tree_name .."-tree")
        })
        for _, tree in pairs(tree_proto_name) do
          tree.minable = true
        end
      end
    end
  end
end)