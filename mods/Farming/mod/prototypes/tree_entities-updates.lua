-- all trees should give a chance to drop bird nests

local trees = data.raw.tree

for tree, tree_data in pairs(trees) do
  local results = tree_data.minable.results or {}
  if tree_data.minable.result then
    results = {{tree_data.minable.result, tree_data.minable.count}}
  end
  table.insert(results, {name = "rs-birds-nest", amount=1, probability=1/10})
  tree_data.minable.results = results
  tree_data.minable.result = nil
end