-- Utility functions commonly used go in here
function contains(array, value)
  for i, v in pairs(array) do
    if v == value then
      return true
    end
  end
  return false
end