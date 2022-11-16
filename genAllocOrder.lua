package.path = 'D:\\Workspace\\lua\\?.lua;D:\\Workspace\\server_kaka_app\\?.lua;' .. package.path
require("dump")


local gameTypes = {
  200,
  210,
  201,
  211,
  213,
  212,
  214,
  215,
  216,
  217,
  218,
  219,
  220,
  221,
  233,
  206,
  222,
  230,
  224,
  229,
  231,
  232,
  234,
  235,
  236,
  237,
  238,
  239,
  240,
}

local gameInfos = {
  [200] = { name = "跑得快",       capacity = 3, level = 4 },
  [210] = { name = "红中麻将",     capacity = 4, level = 4 },
  [201] = { name = "斗地主",       capacity = 3, level = 4 },
  [206] = { name = "柳州麻将",     capacity = 4, level = 4 },
  [211] = { name = "惠州庄麻将",   capacity = 4, level = 4 },
  [213] = { name = "跑风麻将",     capacity = 4, level = 4 },
  [212] = { name = "拖三字",       capacity = 4, level = 4 },
  [214] = { name = "枞阳麻将",     capacity = 4, level = 4 },
  [215] = { name = "安徽跑得快",   capacity = 3, level = 4 },
  [216] = { name = "安庆三副",     capacity = 4, level = 4 },
  [217] = { name = "安庆两副",     capacity = 4, level = 4 },
  [218] = { name = "安庆点炮",     capacity = 4, level = 4 },
  [219] = { name = "海南麻将",     capacity = 4, level = 4 },
  [220] = { name = "海南跑得快",   capacity = 3, level = 4 },
  [221] = { name = "海南地主牌",   capacity = 4, level = 4 },
  [233] = { name = "桐城跑得快",   capacity = 4, level = 4 },
  [222] = { name = "陵水跑得快",   capacity = 4, level = 4 },
  [230] = { name = "三公",         capacity = 9, level = 4 },
  [224] = { name = "临高跑得快",   capacity = 4, level = 4 },
  [229] = { name = "临高麻将",     capacity = 4, level = 4 },
  [231] = { name = "新海南跑得快", capacity = 4, level = 4 },
  [232] = { name = "掼蛋",         capacity = 4, level = 4 },
  [234] = { name = "安庆跑得快",   capacity = 3, level = 4 },
  [235] = { name = "望江麻将",     capacity = 4, level = 4 },
  [236] = { name = "望江跑得快",   capacity = 3, level = 4 },
  [237] = { name = "桐城麻将",     capacity = 4, level = 4 },
  [238] = { name = "桐城点炮",     capacity = 4, level = 4 },
  [239] = { name = "文昌麻将",     capacity = 4, level = 4 },
  [240] = { name = "文昌十三张",   capacity = 4, level = 4 },
}

local names = {"好友房", "玩豆", "金币", "自建赛", "定人赛", "定时赛"}
local kinds      = {    1,     2,     3,     4,     5,     6}
local types      = {    0, 10000, 20000, 30000, 40000, 50000}

function genAllocInfos(gameKind)
  local allocGameInfos = {}
  for _, gtype in ipairs(gameTypes) do
    local gameLevels = {}
    local gameInfo = gameInfos[gtype]
    local gameLevel = gameInfo.level
    if gameKind ~= 3 then
      gameLevel = 1
    end
    for level = 1, gameLevel do
      local orders = {}
      for count = gameInfo.capacity - 1, 0, -1 do
        table.insert(orders, count)
      end
      table.insert(gameLevels, orders)
    end
    
    table.insert(allocGameInfos, {
        gameType = gtype + types[gameKind],
        gameLevels = gameLevels,
        name = gameInfos[gtype].name
    })
  end
  return allocGameInfos
end


local context = "alloc_game_map = {\n"
for _, gameKind in ipairs(kinds) do
  if gameKind > 2 then
    local allocInfos = genAllocInfos(gameKind)
    for _, gameInfo in ipairs(allocInfos) do  
      context = context .. string.format("\t-- %s%s\n", gameInfo.name, names[gameKind])
      context = context .. string.format("\t[%d] = {\n", gameInfo.gameType)
      for level, orders in ipairs(gameInfo.gameLevels) do
        context = context .. string.format("\t\t[%d] = {%s},\n", level, table.concat(orders, ", "))
      end
      context = context .. string.format("\t},\n")
    end
  end
end
context = context .. "},\n"
print(context)