
function dump(t, tip)
  if type(t) ~= 'table' then
      print((tip and tostring(tip) or "output")  .. ":\n" .. tostring(t))
      return
  end
  
  local function strcopy(value, count)
      local list = {}
      for i = 1, count do
        table.insert(list, value)
      end
      return table.concat(list)
  end
  
  local function counts(t)
    local count = 0
    for k, v in pairs(t) do
      count = count + 1
    end
    return count
  end
  
  local space = '    '
  local function iter(t, deep)
    deep = deep + 1
    local count = 0
    local tcount = counts(t)
    local spaces = strcopy(space, deep)
    local str = ""
    for k, v in pairs(t) do
      count = count + 1
      local key = type(k) == 'number' and "[" .. tostring(k) .. "]" or tostring(k)
      if type(v) == 'table' then
        str = str .. spaces .. key .. " = {\n" .. iter(v, deep) .. spaces .. "}" .. (count == tcount and "\n" or ",\n")
      else
        local val = (type(v) == 'number' or type(v) == 'boolean') and tostring(v) or ("\"" .. tostring(v) .. "\"")
        str = str .. spaces .. key .. " = " .. val .. (count == tcount and "\n" or ",\n")
      end
    end
    return str
  end
  
  local str = "{\n".. iter(t, 0) .. "}\n"
  print((tip and tostring(tip) or "output") .. ":\n" .. str)
end

