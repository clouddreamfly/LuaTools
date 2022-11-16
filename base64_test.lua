package.path = 'D:\\Workspace\\lua\\?.lua;' .. package.path
require("dump")
local base64 = require("base64")

local result1 = base64.encode("base/halls/hall_private/hallList/joinPrivateHall.prefab")
print("base64 encode=", result1)

local result2 = base64.decode('35tr0XAsBKwpisTBkVtbwM')
print("base64 decode=", result2)



local str = "-2210540.5555533333433"
local pt = string.find(str, '%.')
print(pt)
if pt and tonumber(str) then 
print(string.sub(str, pt))
end