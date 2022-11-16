
package.path = 'D:\\Workspace\\lua\\?.lua;D:\\Workspace\\server_kaka_app\\?.lua;' .. package.path
require('lua.system.functions')
require("dump")

local test1 = {
  a = 3
}

local test2 = {
  b = 4
}

local mt = { 
  __index = function(tab, key)
      print("index", tab, key)
      return rawget(tab, key)
  end,
  __gc = function(tab)
      print("release", tab)
    end,
  __add = function(tab1, tab2)
    print("add", tab1, tab2)
      return tab1.a + tab2.b
    end,
}

setmetatable(test1, mt)
setmetatable(test2, mt)

print(test1, mt) 
print(test1.a) 
print(test1 + test2) 
test1 = nil

-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

sas = {10}
tm2 = {
  __call = function(mytable, newtable)
      print(mytable, newtable)
        sum = 0
        for i = 1, table_maxn(mytable) do
                sum = sum + mytable[i]
        end
        for i = 1, table_maxn(newtable) do
                sum = sum + newtable[i]
        end
        return sum
  end
}
-- 定义元方法__call
mytable1 = setmetatable(sas, tm2)
newtable = {10,}
table.insert(mytable1, 30)
print(sas,tm2, mytable1(newtable), getmetatable(mytable1))
print(mytable1,newtable, sas(newtable), getmetatable(sas))



function printf(fmt, ...)
  print("str",...)
  local n = select("#", ...)
  print(n)
  local args = {...}
  for i = 1, n do
    print(args[i])
  end
  print(string.format(fmt, ...))
end

local a="4"
local b=2
printf("a=%s,m=%s,b=%d", a, nil, b)


print(select("#", 2, nil, nil,1))
print(string.format("%s %s %q", nil, 1.6339387107748e+015, "ssssss df"))

print("sdfdf", test2.b)
test2.b = nil
print(test2.b)

local test = {1, 2, 3}

dump(test)


local meta =
{
    __gc = function(self)
        print("破坏自我： " .. self.name)
        if self.dtor then
          self:dtor()
        end
    end
}

local t = setmetatable({ name = "outer" }, meta)
function t:dtor()
  print("破坏自我2： " .. self.name)
end
t = nil
print("ssssssssssssssssssss")
do
    local t = { name = "inner" }
    setmetatable(t, meta)
end

local fs = require "fs"

dump(fs)


--dump(string.compareby("123","124" , {"1", "2"}))



local pool = {}
local co = coroutine.create(function() print(coroutine.running()) coroutine.yield() end )
pool[co] = 33
coroutine.resume(co)
print("co", co)
dump(pool)

local tt = {1,2,3}
dump(table.remove(tt))
dump(tt)

local MAX_SEQ = 4394967295
local coroutine_pool = {}
local session_coroutine_id = {}
local running_thread
local session_seq = 0
local timer_thread

local function co_create(func)
    local co = table.remove(coroutine_pool)
    if co == nil then
        co = coroutine.create(function (...)
            func(...)
			print("+++++")
            while true do
                local session = session_coroutine_id[co]
                if session and session ~= 0 then
                    print("+++++err")
                end

                if session then
                    session_coroutine_id[co] = nil
                end

                func = nil
                coroutine_pool[#coroutine_pool + 1] = co
                func = coroutine.yield("SUSPEND")
                func(coroutine.yield())
            end
        end)
    else
		print("++++22+")
        local running = running_thread
        coroutine.resume(co, func)
        running_thread = running
    end
    return co
end

local function co_yield() 
  return coroutine.yield("SUSPEND")
end

local function co_resume(co, ...)
	running_thread = co
	return coroutine.resume(co, ...)
end

local function genSessionSeq()
    repeat
        session_seq = (session_seq + 1) % MAX_SEQ
    until session_seq > 0

    return session_seq
end

local function co_fork(func)
	local co = co_create(func)
	session_coroutine_id[co] = genSessionSeq()
	--co_resume(co)
	return co
end



local co = co_fork(function(i) 
    print("timer",i)
    while true do
      i = co_yield(1)
      print("timer",i)
    end
end)

local co1 = co_fork(function(i) 
    print("timer1",i)
    while true do
      i = co_yield(1)
      print("timer1",i)
    end
end)

for i=1, 3 do
  print("re......1....", i)
  print(co_resume(co, i))
  print("re......2....", i)
  print(co_resume(co1, i))
end

local suss = false
if not suss then
  print("sdfdf")
end

function handler(obj, method)
  return function(...)
    method(obj, ...)
  end
end

local dd = {}

function dd:print(...)
  local di = debug.getinfo(2)
  dump(di)
  print(...)
end

local func = handler(dd, dd.print)

func("sdfdfdf===")

print(table.pack(1,3, 4))

setmetatable(dd, {__mode = "kv"})
local tt = {1,3}
local tc = {2,4}

dd.a = tt
dd.b = tc
dump(dd)
tt = nil
dd.b= nil
collectgarbage()

dump(dd)
local st = {1,3,2,3,9,6}
table.sort(st, function(x, y) return x > y end)
dump(st)

if 1 == 1 then
  print("sdfdfdfddddddddddddddddddddd")
end

print(14%3, 13%3)

local ids= {1, 2, 3, 4}
for _, v in ipairs(ids) do
  --print("tream", v, "<=>", (v - 1 + 2) % 4 + 1)
  print("tream", v, "<=>", v + 1 > 4 and 1 or v + 1)
end
