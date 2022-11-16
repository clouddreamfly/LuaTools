package.path = 'D:\\Workspace\\lua\\?.lua;D:\\Workspace\\server_kaka_app\\?.lua;' .. package.path
require("dump")

local conn1 = {
		[3] = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ,14, 15, 22, 23, 24, 25, 26, 27, 28, 29},
		[5] = {7, 21},
		[6] = {5, 7, 8, 9, 18, 20, 21, 22, 23, 28},
		[7] = {19},
		[8] = {7, 16, 18},
		[9] = {17},
		[10] = {7},
		[12] = {10, 8},
		[13] = {9, 8},
		[14] = {6, 8, 9, 12},
		[15] = {9, 8},
		[21] = {9},
		[22] = {5, 7, 8, 9, 25},
		[23] = {5, 7, 8, 12, 18, 26},
		[28] = {5, 7, 8, 12, 18, 29, 24}
}
  
local conn2 = {
		[3] = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33},
		[5] = {7, 21},
		[6] = {5, 7, 8, 9, 18, 20, 21, 22, 23, 28},
		[7] = {19},
		[8] = {7, 16, 18},
		[9] = {17},
		[10] = {7},
		[12] = {10, 8},
		[13] = {9, 8},
		[14] = {6, 8, 9, 12, 32},
		[15] = {9, 8},
		[21] = {9},
		[22] = {5, 8, 9, 25},
		[23] = {5, 7, 8, 12, 18, 26},
		[28] = {5, 7, 8, 12, 18, 29, 24},
		[30] = {9, 7, 18},
		[31] = {9, 7, 30, 33, 35},
		[32] = {7, 8, 9, 18, 20, 30, 31, 34, 35},
		[33] = {9, 7, 18},
		[34] = {9, 7, 18},
}

local baseServers = {
    {srv_type = 2,  name = 'index',           path = 'index',                id = 10000, count = 1},
    {srv_type = 3,  name = 'agent',           path = 'agent',                id = 10010, idb =10020, count = 10},
    {srv_type = 7,  name = 'user',            path = 'user',                 id = 10080, count = 10},
    {srv_type = 8,  name = 'cache',           path = 'servers\\cache',       id = 10050, count = 20},
    {srv_type = 9,  name = 'userinfo',        path = 'servers\\userinfo',    id = 10100, count = 10},
    {srv_type = 10, name = 'message',         path = 'message',              id = 10002, count = 1},
    {srv_type = 12, name = 'mail',            path = 'servers\\mail',        id = 10140, count = 1},
    {srv_type = 13, name = 'mall',            path = 'servers\\mall',        id = 10150, count = 2},
    {srv_type = 14, name = 'activity',        path = 'servers\\activity',    id = 10120, count = 2},
    {srv_type = 15, name = 'ranking',         path = 'servers\\ranking',     id = 10160, count = 2},
    {srv_type = 16, name = 'cache_aux',       path = 'servers\\CacheAux',    id = 10130, count = 2},
    {srv_type = 18, name = 'record',          path = 'record',               id = 10070, count = 1},
    {srv_type = 19, name = 'online',          path = 'online',               id = 10040, count = 1},
    {srv_type = 21, name = 'alloccollection', path = 'alloccollection',      id = 10170, count = 1},
    {srv_type = 24, name = 'prop',            path = 'prop',                 id = 10240, count = 1},
    {srv_type = 25, name = 'match1manager',   path = 'match1manager',        id = 10003, count = 1},
    {srv_type = 26, name = 'match2manager',   path = 'match2manager',        id = 10004, count = 1},
    {srv_type = 27, name = 'worldchatroom',   path = 'worldchatroom',        id = 10005, count = 1},
    {srv_type = 29, name = 'match3manager',   path = 'match3manager',        id = 10006, count = 1},
    {srv_type = 30, name = 'club',            path = 'club',                 id = 10270, count = 1},
}

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
  [211] = "惠州庄",
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

local gameCNames = {
  [200] = "paodekuai",
  [210] = "mjhz",
  [201] = "landlord",
  [206] = "mjlz",
  [211] = "mjhzz",
  [213] = "mjpf",
  [212] = "vxk",
  [214] = "mjzy",
  [215] = "ahpaodekuai",
  [216] = "aqsf",
  [217] = "aqlf",
  [218] = "aqdp",
  [219] = "mjhn",
  [220] = "hnpaodekuai",
  [221] = "dzp",
  [233] = "tcpaodekuai",
  [222] = "lspdk",
  [230] = "sangong",
  [224] = "lgpdk",
  [229] = "mjlingao",
  [231] = "newhnpdk",
  [232] = "guandan",
  [234] = "aqpaodekuai",
  [235] = "mjwj",
  [236] = "wjpdk",
  [237] = "mjtc",
  [238] = "mjtcdp",
  [239] = "mjwc",
  [240] = "wcpdk",
  
  [241] = "yxzp",
  [242] = "yzzpsw",
  [243] = "lzzpby",
  [245] = "hhzphgw",
  [205] = "glzp",
  [246] = "cdzp",
  
  [250] = "mjhy",
  [208] = "mjgl",
  [251] = "mjcs",
  [252] = "kwx",
  
  [223] = "landlordns",
  [225] = "hnpdk",
  [226] = "hnpdk15",
  
  [202] = "runmachine",
  [209] = "xxl",
  [203] = "shuiyv",
  [204] = "fruitslot",
  [207] = "att",
}

local indexId = 10000
local serverIp = "172.18.171.154"
local testServerIp = "192.168.2.202"
local indexServerIp = "172.18.171.154"
local testIndexServerIp = "192.168.2.202"
local names = {"card", "bean", "coin", "offline", "person", "time"}
local cnames = {"card", "bean", "coin", "match", "match", "match"}
local kinds      = {    1,     2,     3,     4,     5,     6}
local types      = {    0, 10000, 20000, 30000, 40000, 50000}
local levels     = {    1,     1,     6,     1,     1,     1}
local useLevels  = {    1,     1,     3,     1,     1,     1}
local matchPorts = {    0,     0,     0, 25500, 27500, 29500}
local allocPorts = {23000, 19500, 17000, 25000, 27000, 29000}
local gamePorts  = {21000, 18000, 11000, 24000, 26000, 28000}
local logLevel = 7
local savePath = "D:\\Workspace\\server_nframe_app\\gconfig"


function genGameInfos(gameKind)
  local gameInfos = {}
  local index1 = 0
  local index2 = 0
  local level = levels[gameKind]
  local matchPort = matchPorts[gameKind]
  local allocPort = allocPorts[gameKind]
  local gamePort = gamePorts[gameKind]
    
  for i = 1, #gameTypes do
      local match = {}
      local alloc = {}
      local group1 = {}
      local group2 = {}
      
      for j = 1, level do
        if gameKind > 3 then
          table.insert(match, matchPort + index1 + (j - 1))
        end
        table.insert(alloc, allocPort + index1 + (j - 1))
   
        local first = gamePort + index2 + (j - 1) * 5
        local last = first + 4
        table.insert(group1, {first = first, last = last })
        table.insert(group2, {first = first + level * 5, last = last + level * 5})
      end
      
      if gameKind == 1 then
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
  
  return gameInfos
end


function copyTable(t, count)
  local tab = {}
  count = #t > count and count or #t
  for i = 1, count do 
    table.insert(tab, t[i])
  end
  
  return tab
end

function getUseLevel(gameKind)
  return useLevels[gameKind] or 1
end

function writeConfig(filename, context)
    file = io.open(filename, "w")
    file:write(context)
    file:close()
end

function configContext(serverInfo, serverIp, indexServerIp, serverType, level, gameType,  gameName, typeName, namePrefix, nameSuffix, logLevel, conn)
    local context = "cfg = {\n"
    
    context = context .. string.format("\tsrv_type = %d,\n", serverType)
    context = context .. string.format("\tname = '%s%s%s%s',\n", namePrefix or "", gameName, typeName and ("_" .. typeName) or "", nameSuffix or "")
    context = context .. "\tsrvs = {\n"
    
    if serverType == 31 then --ClubAlloc
      if type(serverInfo) == "table" then
        for idx, serverId in ipairs(serverInfo)  do
            context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
              serverId, serverId, serverIp, serverId, gameType, level or 1000, logLevel or 7)
        end
      else
        local serverId = tonumber(serverInfo)
        context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
          serverId, serverId, serverIp, serverId, gameType, level or 1000, logLevel or 7)
      end
    elseif serverType == 32 then --ClubGame
      if type(serverInfo) == "table" and not serverInfo.first then
        for idx, group in ipairs(serverInfo) do
            local serverId = group.first
            context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
              serverId, serverId, serverIp, serverId, gameType, level or 1000, logLevel or 7)
        end
      else
        local serverId = tonumber(serverInfo.first)
        context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
          serverId, serverId, serverIp, serverId, gameType, level or 1000, logLevel or 7)
      end
    elseif serverType == 6 then --Game
      if type(serverInfo) == "table" and not level then
        for idx, group in ipairs(serverInfo) do
            local serverId = group.first
            context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
              serverId, serverId, serverIp, serverId, gameType, idx, logLevel or 7)
        end
      else
        local serverId = tonumber(serverInfo.first)
        context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
          serverId, serverId, serverIp, serverId, gameType, level or 1, logLevel or 7)
      end
    else
      if type(serverInfo) == "table" then
        for idx, serverId in ipairs(serverInfo)  do
            context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
              serverId, serverId, serverIp, serverId, gameType, level or idx, logLevel or 7)
        end
      else
        local serverId = tonumber(serverInfo)
        context = context .. string.format("\t\t[%d] = {id = %d, ip = '%s', port = %d, param1 = %d, param2 = %d, log_level = %d},\n",
          serverId, serverId, serverIp, serverId, gameType, level or 1, logLevel or 7)
      end
    end
    
    context = context .. "\t},\n"
    if serverType ~= 2 then
      context = context .. string.format("\tindex = {id = %d, ip = '%s', port = %d}\n", indexId, indexServerIp, indexId)
    elseif conn then
      context = context .. "\tconn = {\n"
      local server_types = {}
      for server_type in pairs(conn) do
        table.insert(server_types, server_type)
      end
      table.sort(server_types)
      for _, server_type in ipairs(server_types) do
        context = context .. string.format("\t\t[%d] = {%s},\n", server_type, table.concat(conn[server_type], ", "))
      end
       context = context .. "\t}\n"
    end
    context = context .. "}\n"
    return context
end

function cluballocConfig(gameInfos, gameKind)
  local serverType = 31
  local useLevel = getUseLevel(gameKind)
  for idx1, gameInfo in ipairs(gameInfos) do
    if gameTypes[idx1] and gameTypes[idx1] > 0 then
      local gameType = types[gameKind] + gameTypes[idx1]
     
      for idx2, serverId in ipairs(gameInfo.alloc) do
        if idx2 <= useLevel then
          local context = configContext(serverId, serverIp, indexServerIp, serverType, 1000, gameType, gameCNames[gameTypes[idx1]], names[gameKind], "club_alloc_", nil, logLevel)

          local dirname = string.format("%s\\cluballoc\\start_cfg\\%s", savePath, gameCNames[gameTypes[idx1]])
          local filename = string.format("%s\\exe_cfg_%s_%d.lua", dirname, names[gameKind], idx2)
          os.execute(string.format("mkdir %s", dirname))
          writeConfig(filename, context)
        end
      end
      
      for idx3, suffix in ipairs({"_t"}) do
        local alloc = copyTable(gameInfo.alloc, useLevel)
        local context = configContext(alloc, testServerIp, testIndexServerIp, serverType, nil, gameType,  gameCNames[gameTypes[idx1]], names[gameKind], "club_alloc_", nil)

        local dirname = string.format("%s\\cluballoc\\start_cfg\\%s", savePath, gameCNames[gameTypes[idx1]])
        local filename = string.format("%s\\exe_cfg_%s%s.lua", dirname, names[gameKind], suffix)
        os.execute(string.format("mkdir %s", dirname))
        writeConfig(filename, context)
      end
    end
  end
end

function clubgameConfig(gameInfos, gameKind)
  local serverType = 32
  local useLevel = getUseLevel(gameKind)
  for idx1, gameInfo in ipairs(gameInfos) do
    if gameTypes[idx1] and gameTypes[idx1] > 0 then
      local gameType = types[gameKind] + gameTypes[idx1]
      
      for idx2, serverInfo in ipairs(gameInfo.group1) do
        if idx2 <= useLevel then
          local context = configContext(serverInfo, serverIp, indexServerIp, serverType, 1000, gameType, gameCNames[gameTypes[idx1]], names[gameKind], "", nil, logLevel)

          local dirname = string.format("%s\\game\\%s\\start_cfg\\%s_%s\\g1", savePath, gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s\\exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          os.execute(string.format("mkdir %s", dirname))
          writeConfig(filename, context)
        end
      end
      
      for idx2, serverInfo in ipairs(gameInfo.group2) do
        if idx2 <= useLevel then
          local context = configContext(serverInfo, serverIp, indexServerIp, serverType, 1000, gameType, gameCNames[gameTypes[idx1]], names[gameKind], "", nil, logLevel)

          local dirname = string.format("%s\\game\\%s\\start_cfg\\%s_%s\\g2", savePath, gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s\\exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          os.execute(string.format("mkdir %s", dirname))
          writeConfig(filename, context)
        end
      end
      
      for idx3, suffix in ipairs({"_t", "_in"}) do
        local group = copyTable(idx3 == 1 and gameInfo.group1 or gameInfo.group2, useLevel)
        local context = configContext(group, testServerIp, testIndexServerIp, serverType, nil, gameType,  gameCNames[gameTypes[idx1]], names[gameKind], "", nil)

        local dirname = string.format("%s\\game\\%s\\start_cfg\\%s_%s", savePath, gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
        local filename = string.format("%s\\exe_cfg_%s%s.lua", dirname, cnames[gameKind], suffix)
        os.execute(string.format("mkdir %s", dirname))
        writeConfig(filename, context)
      end
    end
  end
end

function allocConfig(gameInfos, gameKind)
  local serverType = 5
  local useLevel = getUseLevel(gameKind)
  for idx1, gameInfo in ipairs(gameInfos) do
    if gameTypes[idx1] and gameTypes[idx1] > 0 then
      local gameType = types[gameKind] + gameTypes[idx1]
     
      for idx2, serverId in ipairs(gameInfo.alloc) do
        if idx2 <= useLevel then
          local context = configContext(serverId, serverIp, indexServerIp, serverType, idx2, gameType, gameCNames[gameTypes[idx1]], names[gameKind], "alloc_", nil, logLevel)

          local dirname = string.format("%s\\alloc\\start_cfg\\%s_%s", savePath, gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s\\exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          if gameKind >= 4 then
            filename = string.format("%s\\exe_cfg_%s.lua", dirname, cnames[gameKind])
          end
          os.execute(string.format("mkdir %s", dirname))
          writeConfig(filename, context)
        end
      end
      
      for idx3, suffix in ipairs({"_t"}) do
        local alloc = copyTable(gameInfo.alloc, useLevel)
        local context = configContext(alloc, testServerIp, testIndexServerIp, serverType, nil, gameType,  gameCNames[gameTypes[idx1]], names[gameKind], "alloc_", nil)

        local dirname = string.format("%s\\alloc\\start_cfg\\%s_%s", savePath, gameCNames[gameTypes[idx1]], names[gameKind])
        local filename = string.format("%s\\exe_cfg_%s%s.lua", dirname, cnames[gameKind], suffix)
        os.execute(string.format("mkdir %s", dirname))
        writeConfig(filename, context)
      end
    end
  end
end


function gameConfig(gameInfos, gameKind)
  local serverType = 6
  local useLevel = getUseLevel(gameKind)
  for idx1, gameInfo in ipairs(gameInfos) do
    if gameTypes[idx1] and gameTypes[idx1] > 0 then
      local gameType = types[gameKind] + gameTypes[idx1]
      
      for idx2, serverInfo in ipairs(gameInfo.group1) do
        if idx2 <= useLevel then
          local context = configContext(serverInfo, serverIp, indexServerIp, serverType, idx2, gameType, gameCNames[gameTypes[idx1]], names[gameKind], "", nil, logLevel)

          local dirname = string.format("%s\\game\\%s\\start_cfg\\%s_%s\\g1", savePath, gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s\\exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          if gameKind >= 4 then
            filename = string.format("%s\\exe_cfg_%s.lua", dirname, cnames[gameKind])
          end
          os.execute(string.format("mkdir %s", dirname))
          writeConfig(filename, context)
        end
      end
      
      for idx2, serverInfo in ipairs(gameInfo.group2) do
        if idx2 <= useLevel then
          local context = configContext(serverInfo, serverIp, indexServerIp, serverType, idx2, gameType, gameCNames[gameTypes[idx1]], names[gameKind], "", nil, logLevel)

          local dirname = string.format("%s\\game\\%s\\start_cfg\\%s_%s\\g2", savePath, gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s\\exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          if gameKind >= 4 then
            filename = string.format("%s\\exe_cfg_%s.lua", dirname, cnames[gameKind])
          end
          os.execute(string.format("mkdir %s", dirname))
          writeConfig(filename, context)
        end
      end
      
      for idx3, suffix in ipairs({"_t", "_in"}) do
        local group = copyTable(idx3 == 1 and gameInfo.group1 or gameInfo.group2, useLevel)
        local context = configContext(group, testServerIp, testIndexServerIp, serverType, nil, gameType,  gameCNames[gameTypes[idx1]], names[gameKind], "", nil)

        local dirname = string.format("%s\\game\\%s\\start_cfg\\%s_%s", savePath, gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
        local filename = string.format("%s\\exe_cfg_%s%s.lua", dirname, cnames[gameKind], suffix)
        os.execute(string.format("mkdir %s", dirname))
        writeConfig(filename, context)
      end
    end
  end
end

function matchConfig(gameInfos, gameKind)
  local matchNames = {"matchoffline", "matchperson", "matchtime"}
  local matchTypes = {22, 23, 28}
  local matchName = matchNames[gameKind - 3] or ""
  local serverType = matchTypes[gameKind - 3] or 0
  local useLevel = getUseLevel(gameKind)
  for idx1, gameInfo in ipairs(gameInfos) do
    if gameTypes[idx1] and gameTypes[idx1] > 0 then
      local gameType = types[gameKind] + gameTypes[idx1]
     
      for idx2, serverId in ipairs(gameInfo.match) do
        if idx2 <= useLevel then
          local context = configContext(serverId, serverIp, indexServerIp, serverType, idx2, gameType, gameCNames[gameTypes[idx1]], nil, matchName .. "_", nil, logLevel)

          local dirname = string.format("%s\\%s\\start_cfg\\%s", savePath, matchName, gameCNames[gameTypes[idx1]])
          local filename = string.format("%s\\exe_cfg_match.lua", dirname)
          os.execute(string.format("mkdir %s", dirname))
          writeConfig(filename, context)
        end
      end
      
      for idx3, suffix in ipairs({"_t"}) do
        local match = copyTable(gameInfo.match, useLevel)
        local context = configContext(match, testServerIp, testIndexServerIp, serverType, nil, gameType,  gameCNames[gameTypes[idx1]], nil, matchName .. "_", nil)

        local dirname = string.format("%s\\%s\\start_cfg\\%s", savePath, matchName, gameCNames[gameTypes[idx1]])
        local filename = string.format("%s\\exe_cfg_match%s.lua", dirname, suffix)
        os.execute(string.format("mkdir %s", dirname))
        writeConfig(filename, context)
      end
    end
  end
end

function baseConfig(serverInfo)
  local localServerIp = serverIp
  local localTestServerIp = testServerIp
  local localLevel = 0
  local conn = nil
  if serverInfo.srv_type == 2 then
    conn = conn2
  end
  
  if serverInfo.srv_type == 3 then
    localServerIp = "0.0.0.0"
    localTestServerIp = "0.0.0.0"
  end
  
  if serverInfo.srv_type == 30 then
    localLevel = 1000
  end
  
  for idx1 = 1, serverInfo.count do
    local context = configContext(serverInfo.id + idx1 - 1, localServerIp, indexServerIp, serverInfo.srv_type, localLevel, 0, serverInfo.name, nil, nil, nil, logLevel, conn)

    local dirname = string.format("%s\\%s\\start_cfg", savePath, serverInfo.path)
    local filename = string.format("%s\\exe_cfg%s%s.lua", dirname, idx1 == 1 and "" or "_", idx1 == 1 and "" or tostring(idx1 - 1))
    os.execute(string.format("mkdir %s", dirname))
    writeConfig(filename, context)
    if serverInfo.srv_type == 3 then
      local dirname = string.format("%s\\%s\\start_cfg", savePath, serverInfo.path .. "_old")
    local filename = string.format("%s\\exe_cfg%s.lua", dirname, idx1 == 1 and "" or tostring(idx1 - 1))
      os.execute(string.format("mkdir %s", dirname))
      writeConfig(filename, context)
    end
    
    if serverInfo.idb then
      local context = configContext(serverInfo.idb + idx1 - 1, localServerIp, indexServerIp, serverInfo.srv_type, localLevel, 0, serverInfo.name, nil, nil, nil, logLevel, conn)

      local dirname = string.format("%s\\%s\\start_cfg", savePath, serverInfo.path)
      local filename = string.format("%s\\exe_cfg%s%s_b1.lua", dirname, idx1 == 1 and "" or "_", idx1 == 1 and "" or tostring(idx1 - 1))
      os.execute(string.format("mkdir %s", dirname))
      writeConfig(filename, context)
      if serverInfo.srv_type == 3 then
        local dirname = string.format("%s\\%s\\start_cfg", savePath, serverInfo.path .. "_old")
        local filename = string.format("%s\\exe_cfg%s_b1.lua", dirname, idx1 == 1 and "" or tostring(idx1 - 1))
        os.execute(string.format("mkdir %s", dirname))
        writeConfig(filename, context)
      end
    end
  end
      
  for idx3, suffix in ipairs({"_t"}) do
    local serverids = {}
    for idx2 = 1, serverInfo.count do
      local serverid = serverInfo.id + idx2 - 1
      table.insert(serverids, serverid)
    end
    local context = configContext(serverids, localTestServerIp, testIndexServerIp, serverInfo.srv_type, localLevel, 0,  serverInfo.name, nil, nil, nil, nil, conn)

    local dirname = string.format("%s\\%s\\start_cfg", savePath, serverInfo.path)
    local filename = string.format("%s\\exe_cfg%s.lua", dirname, suffix)
    os.execute(string.format("mkdir %s", dirname))
    writeConfig(filename, context)
    if serverInfo.srv_type == 3 then
      local dirname = string.format("%s\\%s\\start_cfg", savePath, serverInfo.path .. "_old")
      local filename = string.format("%s\\exe_cfg%s.lua", dirname, suffix)
      os.execute(string.format("mkdir %s", dirname))
      writeConfig(filename, context)
    end
  end
end

function clubgameConfigPath(gameInfos, gameKind)
  local serverType = 32
  local useLevel = getUseLevel(gameKind)
  for idx1, gameInfo in ipairs(gameInfos) do
    if gameTypes[idx1] and gameTypes[idx1] > 0 then
      local gameType = types[gameKind] + gameTypes[idx1]
      
      for idx2, serverInfo in ipairs(gameInfo.group1) do
          local dirname = string.format("./lua/game/%s/start_cfg/%s_%s/g1", gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s/exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          local configname = string.format('[%s]="%s"', serverInfo.first, filename)
          print(configname)
      end
      
      for idx2, serverInfo in ipairs(gameInfo.group2) do
          local dirname = string.format("./lua/game/%s/start_cfg/%s_%s/g2", gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s/exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          local configname = string.format('[%s]="%s"', serverInfo.first, filename)
          print(configname)
      end
    end
  end
end

function gameConfigPath(gameInfos, gameKind)
  local serverType = 6
  local useLevel = getUseLevel(gameKind)
  for idx1, gameInfo in ipairs(gameInfos) do
    if gameTypes[idx1] and gameTypes[idx1] > 0 then
      local gameType = types[gameKind] + gameTypes[idx1]
      
      for idx2, serverInfo in ipairs(gameInfo.group1) do
          local dirname = string.format("./lua/game/%s/start_cfg/%s_%s/g1", gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s/exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          if gameKind >= 4 then
            filename = string.format("%s/exe_cfg_%s.lua", dirname, cnames[gameKind])
          end
          local configname = string.format('[%s]="%s"', serverInfo.first, filename)
          print(configname)
      end
      
      for idx2, serverInfo in ipairs(gameInfo.group2) do
          local dirname = string.format("./lua/game/%s/start_cfg/%s_%s/g2", gameCNames[gameTypes[idx1]], gameCNames[gameTypes[idx1]], names[gameKind])
          local filename = string.format("%s/exe_cfg_%s_%d.lua", dirname, cnames[gameKind], idx2)
          if gameKind >= 4 then
            filename = string.format("%s/exe_cfg_%s.lua", dirname, cnames[gameKind])
          end
          local configname = string.format('[%s]="%s"', serverInfo.first, filename)
          print(configname)
      end
    end
  end
end

function genConfig()
  for _, gameKind in ipairs(kinds) do
    local gameInfos = genGameInfos(gameKind)
    if gameKind == 1 then
      cluballocConfig(gameInfos, gameKind)
      clubgameConfig(gameInfos, gameKind)
    else
      allocConfig(gameInfos, gameKind)
      gameConfig(gameInfos, gameKind)
      
      if gameKind >= 4 then
        matchConfig(gameInfos, gameKind)
      end
    end
  end
end

function genBaseConfig()
  for _, serverInfo in pairs(baseServers) do
    baseConfig(serverInfo)
  end
end

function genExecCmd()
  for _, gameKind in ipairs(kinds) do
    if gameKind == 1 then
      for idx = 1, #gameTypes do
        local gameType = types[gameKind] + gameTypes[idx]
        local filename = string.format("./club_game_%s", gameCNames[gameTypes[idx]])
        local configname = string.format('[%s]="%s"', gameType, filename)
        print(configname)
      end
    elseif gameKind >= 4 then
      for idx = 1, #gameTypes do
        local gameType = types[gameKind] + gameTypes[idx]
        local filename = string.format("./match_game_%s", gameCNames[gameTypes[idx]])
        local configname = string.format('[%s]="%s"', gameType, filename)
        print(configname)
      end
    else
      for idx = 1, #gameTypes do
        local gameType = types[gameKind] + gameTypes[idx]
        local filename = string.format("./game_%s", gameCNames[gameTypes[idx]])
        local configname = string.format('[%s]="%s"', gameType, filename)
        print(configname)
      end
    end
  end
end

function genExecPath()
  for _, gameKind in ipairs(kinds) do
    for idx = 1, #gameTypes do
      local gameType = types[gameKind] + gameTypes[idx]
      local filename = string.format("./lua/game/%s/main.lua", gameCNames[gameTypes[idx]])
      local configname = string.format('[%s]="%s"', gameType, filename)
      print(configname)
    end
  end
end

function genConfigPath()
  for _, gameKind in ipairs(kinds) do
    local gameInfos = genGameInfos(gameKind)
    if gameKind == 1 then
      clubgameConfigPath(gameInfos, gameKind)
    else
      gameConfigPath(gameInfos, gameKind)
    end
  end
end

--genConfig()
--genBaseConfig()
--genExecCmd()
--genExecPath()
genConfigPath()