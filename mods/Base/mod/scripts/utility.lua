-- Base functions commonly used go in here
function contains(array, value)
  for i, v in pairs(array) do
    if v == value then
      return true
    end
  end
  return false
end

function add_leading_zeros(num, str_length)
  local res = tostring(num)
  local l = string.len(res)
  for i = 0,(str_length-l-1) do
    res = 0 .. res
  end
  return res
end

function format_number(amount, delimiter)
  local formatted = amount
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1'..delimiter..'%2')
    if (k==0) then
      break
    end
  end
  return formatted
end