ID2Ai = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2}
ID2Vi = {[0]=1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2}

--ľ����֤���䣬ֻ�����һλ
function CheckID2(nID2_No)
assert("string" == type(nID2_No))
assert(17 == string.len(nID2_No), "������������֤ǰ17λ")

local arrID2={1}
local sum = 0
for i=1, 17 do
	arrID2[i] = tonumber(string.sub(nID2_No, i, i))
	sum = sum + arrID2[i] * ID2Ai[i]
end

local n18 = sum % 11
	print("���һλӦ���ǣ�", ID2Vi[n18])
end

--CheckID2('421asdasdasda4')

CheckID2("43072619900824161")
--430124198606298992

function IsLeapYear(nYear)
	if (0 == nYear % 400) or (0 == nYear % 4 and 0 ~= nYear % 100) then
		print(nYear .. '��������')
	else
		print(nYear .. '�겻������')
	end
end

