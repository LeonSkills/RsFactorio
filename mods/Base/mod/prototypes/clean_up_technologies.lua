-- mods might add some redundant technologies. This one removes those.
-- side effect, will also do that for all other mods. Is that desired?
--
local function get_all_prereqs(tech)
  if tech.prereqs then
    return tech.prereqs
  end
  tech.prereqs = {}
  if not tech.prerequisites then
    return tech.prereqs
  end
  for j, prereq in pairs(tech.prerequisites) do
    if prereq == tech.name then
      error("Cyclic prerequisite found at technology " .. tech.name)
    end
    local prereq_tech = data.raw.technology[prereq]
    if not prereq_tech then
      print("Technology " .. prereq .. " does not exist, removing as prerequisite.")
      tech.prerequisites[j] = nil
    else
      local prereqs = get_all_prereqs(prereq_tech)
      for preprepre, b in pairs(prereqs) do
        if preprepre == tech.name then
          error("Cyclic prerequisite found at technology " .. tech.name)
        end
        tech.prereqs[preprepre] = b
      end
    end
  end
  for i, prereq in pairs(tech.prerequisites) do
    if tech.prereqs[prereq] then
      print("Prerequisite " .. prereq.. " was already required in technology " .. tech.name .. ". Removing as prerequisite")
      tech.prerequisites[i] = nil
    end
    tech.prereqs[prereq] = true
  end
  return tech.prereqs
end

for name, tech in pairs(data.raw.technology) do
  local x = get_all_prereqs(tech)
end
