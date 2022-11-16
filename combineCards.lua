package.path = 'D:\\Workspace\\lua\\?.lua;' .. package.path
require("dump")


--[[
	组合牌
]]
function combineCards(cards, width)
	if width > #cards then
		return {}
	end

	local len = #cards
	local meta = {}
	-- init meta data
	for i = 1, len do
		if i <= width then
			table.insert(meta, 1)
		else
			table.insert(meta, 0)
		end
	end

	--get result
	local getResult = function()
		local tmp = {}
		for i = 1, len do
			if meta[i] == 1 then
				table.insert(tmp, cards[i])
			end
		end
		return tmp
	end

	local result = {}
	-- 记录一次组合
	table.insert(result, getResult())

	while true do
		-- 前面连续的0
		local zero_count = 0
		for i = 1, len - width do
			if meta[i] == 0 then
				zero_count = zero_count + 1
			else
				break
			end
		end

		-- 前m-n位都是0，说明处理结束
		if zero_count == len - width then
			break
		end

		local idx
		for j = 1, len - 1 do
			-- 10 交换为 01
			if meta[j] == 1 and meta[j + 1] == 0 then
				meta[j], meta[j + 1] = meta[j + 1], meta[j]
				idx = j
				break
			end
		end

		-- 将idx左边所有的1移到最左边
		local k = idx - 1
		local count = 0
		while count <= k do
			for i = k, 2, -1 do
				if meta[i] == 1 then
					meta[i], meta[i - 1] = meta[i - 1], meta[i]
				end
			end
			count = count + 1
		end

		-- 记录一次组合
		table.insert(result, getResult())
	end

	return result
end

local cards = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}

for i = 1, 3 do
  dump(combineCards(cards, i), "index=["..i.."]")
end
