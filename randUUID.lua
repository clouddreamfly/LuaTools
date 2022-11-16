package.path = 'D:\\Workspace\\lua\\?.lua;' .. package.path
require("dump")

math.randomseed(os.time()+ os.clock())

function randCode(count)
  local randnum = {0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F'}
  local str = ""
  for i = 1, count do
    str = str .. tostring(randnum[math.random(1,#randnum)])
  end
  return str
end


function randomUuid(len)
    local chars = 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba1234567890'
    local uuid = ''
    local i = 0

    len = len or 1
    for n = 1, len do
      i = math.random(1, #chars)
      uuid = uuid .. string.sub(chars, i, i)
    end

    return uuid
end

print("-------------------------------------------------------------------------------------------------------")

for i = 1, 10 do
  print(randCode(4), randCode(6), randCode(8), randCode(12), randCode(16), randCode(32), randCode(64))
end

print("-------------------------------------------------------------------------------------------------------")

for i = 1, 10 do
  print(randomUuid(4), randomUuid(6), randomUuid(8), randomUuid(12), randomUuid(16), randomUuid(32), randomUuid(64))
end

print("-------------------------------------------------------------------------------------------------------")