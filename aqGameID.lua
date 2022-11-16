package.path = 'D:\\Workspace\\lua\\?.lua;' .. package.path
require("dump")


local game_config = {
  [1] = "paodekuai3",
  [8] = "paodekuai2",
  [85] = "club",
  [151] = "aqjj3",
  [152] = "aqjj2",
  [153] = "aqdp2",
  [154] = "aqdp3",
  [155] = "aqdp4",
  [156] = "vxk",
  [157] = "guandan",
  [158] = "tcmj2",
  [159] = "tcmj3",
  [160] = "tcmj4",
  [161] = "tcdp2",
  [162] = "tcdp3",
  [163] = "tcdp4",
  [164] = "landlord",
  [165] = "aqpf2",
  [166] = "aqpf3",
  [167] = "aqpf4",
  [168] = "nzmj2",
  [169] = "nzmj3",
  [170] = "nzmj4",
  [171] = "ahhz2",
  [172] = "ahhz3",
  [173] = "ahhz4",
  [190] = "gdmj2",
  [191] = "gdmj3",
  [192] = "gdmj4",
  [194] = "zymj2",
  [195] = "zymj3",
  [196] = "zymj4",
  [204] = "ahpaodekuai3",
  [205] = "ahpaodekuai2",
  [206] = "tcpaodekuai3",
  [207] = "tcpaodekuai2",
}


local gameids = {26410, 26510, 26610} 
local gameids_ = {}
local gameids1 = {}
local gameids2 = {}
local gameids11 = {}
local gameids22 = {}
for _, v in pairs(gameids) do
  local value = v % 20 >= 10 and v - 10 or v + 10
  local gameids111 = {}
  local gameids222 = {}
  for i = 0, 9 do
    table.insert(gameids1, v + i)
    table.insert(gameids2, value + i)

    table.insert(gameids111, v + i)
    table.insert(gameids222, value + i)
  end
  table.insert(gameids11, gameids111)
  table.insert(gameids22, gameids222)
  table.insert(gameids_, value)
end
print(#gameids)
print(table.concat(gameids, ','))
print("")
print(table.concat(gameids_, ','))
print("")
print(table.concat(gameids1, ','))
print("")
print(table.concat(gameids2, ','))

local notgames = {}

function find(id)
  for _, v in pairs(notgames) do
    if v == id then
      return true
    end
  end
end

function search(list, id)
  for _, v in pairs(list or {}) do
    if v == id then
      return true
    end
  end
end

print("=========================================")
for k, values in ipairs(gameids22) do
  if find(values[1]) then
    print("")
    print(k, values[1] % 20 >= 10 and 'p2' or 'p1',  math.floor(values[1]/100)-100+1, table.concat(values, ','))
  end
end
print("=========================================")
local count = 0
local cmdstr = ""
local cmdstr2 = ""
local cmdstr3 = ""
local cmd_game_types = {}
local cmd_game_names = {}
local cmd_game_whos = {}
for k, values in ipairs(gameids22) do
  if not find(values[1])  then -- and values[1] % 20 >= 10  and values[1] % 20 < 10
    count = count + 1
    local game_type =  math.floor(values[1]/100)-100+1
    local game_ids = table.concat(values, ',')
    local game_name = game_config[game_type] or ""
    local game_who = values[1] % 20 >= 10 and 'p2' or 'p1'
    print("")
    print(k, game_name,  game_who,  game_type, game_ids)
    cmdstr = cmdstr .. "nohup ./main proxy_game " .. game_type .." " .. game_name .. " ".. game_who .. " >/dev/null 2>&1 &\n"
    cmdstr2 = cmdstr2 .. "kill -9  " .. game_type .." " .. game_name .. " ".. game_who .. "\n"
    if not search(cmd_game_types, game_type) then
      table.insert(cmd_game_types, game_type)
    end

    if not search(cmd_game_names, game_name) then
      table.insert(cmd_game_names, game_name)
    end

    if not search(cmd_game_whos, game_who) then
      table.insert(cmd_game_whos, game_who)
    end
  end
end
cmdstr3 = "ps aux | grep -v grep | grep proxy_game"
cmdstr3 = cmdstr3 .. " | grep -a -w \"" .. table.concat(cmd_game_types, "\\|") .. "\""
cmdstr3 = cmdstr3 .. " | grep -a -w \"" .. table.concat(cmd_game_names, "\\|") .. "\""
cmdstr3 = cmdstr3 .. " | grep -a -w \"" .. table.concat(cmd_game_whos, "\\|") .. "\""
cmdstr3 = cmdstr3 .. " | awk '{print $2}'"
cmdstr3 = cmdstr3 .. " | xargs kill -9 "
print("count=", count)
print(cmdstr)
print(cmdstr2)
print(cmdstr3)
