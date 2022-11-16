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
  
  241,
  242,
  243,
  245,
  205,
  246,

  250,
  208,
  251,
  252,

  223,
  225,
  226,

  202,
  209,
  203,
  204,
  207,
}

local gameNames = {
  [200] = "跑得快",
  [210] = "红中麻将",
  [201] = "斗地主",
  [206] = "柳州麻将",
  [211] = "惠州庄麻将",
  [213] = "跑风麻将",
  [212] = "拖三字",
  [214] = "枞阳麻将",
  [215] = "安徽跑得快",
  [216] = "安庆三副",
  [217] = "安庆两副",
  [218] = "安庆点炮",
  [219] = "海南麻将",
  [220] = "海南跑得快",
  [221] = "海南地主牌",
  [233] = "桐城跑得快",
  [222] = "陵水跑得快",
  [230] = "三公",
  [224] = "临高跑得快",
  [229] = "临高麻将",
  [231] = "新海南跑得快",
  [232] = "掼蛋",
  [234] = "安庆跑得快",
  [235] = "望江麻将",
  [236] = "望江跑得快",
  [237] = "桐城麻将",
  [238] = "桐城点炮",
  [239] = "文昌麻将",
  [240] = "文昌十三张",
  
  [241] = "攸县字牌",
  [242] = "永州字牌双王",
  [243] = "lz字牌by",
  [245] = "怀化字牌红拐弯",
  [205] = "桂林字牌",
  [246] = "常德字牌",
  
  [250] = "衡阳麻将",
  [208] = "桂林麻将",
  [251] = "长沙麻将",
  [252] = "卡五星",
  
  [223] = "斗地主ns",
  [225] = "湖南跑得快",
  [226] = "湖南跑得快15张",
  
  [202] = "runmachine",
  [209] = "消消乐",
  [203] = "shuiyv",
  [204] = "水果拉霸",
  [207] = "att",
}

local names = {"好友房", "玩豆", "金币", "自建赛", "定人赛", "定时赛"}
local types      = {    0, 10000, 20000, 30000, 40000, 50000}
local levels     = {    1,     1,     6,     1,     1,     1}
local matchPorts = {    0,     0,     0, 25500, 27500, 29500}
local allocPorts = {23000, 19500, 17000, 25000, 27000, 29000}
local gamePorts  = {21000, 18000, 11000, 24000, 26000, 28000}

local gameInfos = {}
local index1 = 0
local index2 = 0
local gameIndex = 4
local level = levels[gameIndex]
local matchPort = matchPorts[gameIndex]
local allocPort = allocPorts[gameIndex]
local gamePort = gamePorts[gameIndex]
local isfilter = true
local filters = {
  [222] = true,
  [224] = true,
  [240] = true,
  [219] = true,
}

for i = 1, #gameTypes do
    local match = {}
    local alloc = {}
    local group1 = {}
    local group2 = {}
    
    for j = 1, level do
      if gameIndex > 3 then
        table.insert(match, matchPort + index1 + (j - 1))
      end
      table.insert(alloc, allocPort + index1 + (j - 1))
 
      local first = gamePort + index2 + (j - 1) * 5
      local last = first + 4
      table.insert(group1, {first = first, last = last })
      table.insert(group2, {first = first + level * 5, last = last + level * 5})
    end
    
    if gameIndex == 1 then
      index1 = index1 + level * 10
    else
      index1 = index1 + level
    end
    index2 = index2 + level * 10
  
    local gameInfo = {
        match = match,
        alloc = alloc,
        group1 = group1,
        group2 = group2,
    }
    table.insert(gameInfos, gameInfo)
end

local context = ""

for i, gameInfo in ipairs(gameInfos) do
    if gameTypes[i] and gameTypes[i] > 0 and (not isfilter or filters[gameTypes[i]]) then
      context = context .. string.format("%d、%s%s\n", i, gameNames[gameTypes[i]] or "", names[gameIndex])
      context = context .. string.format("类型：%d \n", (gameTypes[i] or 0) + types[gameIndex])
      if gameIndex > 3 then
        context = context .. "比赛：\n"
        for j, match in ipairs(gameInfo.match) do
          context = context .. string.format("场次%d:%d%s", j, match, j < level and "," or "\n")
        end
      end
      context = context .. "配桌：\n"
      for j, alloc in ipairs(gameInfo.alloc) do
        context = context .. string.format("场次%d:%d%s", j, alloc, j < level and "," or "\n")
      end
      context = context .. "游戏：\n"
      context = context .. "group1：\n"
      for j, group in ipairs(gameInfo.group1) do
        context = context .. string.format("场次%d:%d-%d%s", j, group.first, group.last, j < level and "," or "\n")
      end
      context = context .. "group2：\n"
      for j, group in ipairs(gameInfo.group2) do
        context = context .. string.format("场次%d:%d-%d%s", j, group.first, group.last, j < level and "," or "\n")
      end
      context = context .. "\n"
    end
end

print(context)