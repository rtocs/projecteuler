local ret = 0
local list = {}

list["1"] = "One"
list["2"] = "Two"
list["3"] = "Three"
list["4"] = "Four"
list["5"] = "Five"
list["6"] = "Six"
list["7"] = "Seven"
list["8"] = "Eight"
list["9"] = "Nine"
list["10"] = "Ten"
list["11"] = "Eleven"
list["12"] = "Twelve"
list["13"] = "Thirteen"
list["14"] = "Fourteen"
list["15"] = "Fifteen"
list["16"] = "Sixteen"
list["17"] = "Seventeen"
list["18"] = "Eighteen"
list["19"] = "Nineteen"
list["20"] = "Twenty"
list["30"] = "Thirty"
list["40"] = "Forty"
list["50"] = "Fifty"
list["60"] = "Sixty"
list["70"] = "Seventy"
list["80"] = "Eighty"
list["90"] = "Ninety"
list["100"] = "Hundred"

local function getNumAsNumOfLetters(s)
	local ret = ""

	if #s == 3 then
		ret = list[string.sub(s, 1, 1)] .. list["100"]

		if string.sub(s, 2, 3) ~= "00" then
			ret = ret .. "and"
		end
		if string.sub(s, 2, 2) ~= "0" then
			s = string.sub(s, 2, 3)
		else
			s = string.sub(s, 3, 3)
		end
	end

	if #s == 2 then
		if list[s] ~= nil then
			ret = ret .. list[s]
			s = ""
		else
			ret = ret .. list[string.sub(s, 1, 1) .. "0"]
			s = string.sub(s, 2, 2)
		end
	end

	if #s == 1 and s ~= "0" then
		ret = ret .. list[s]
	end

	-- print(ret)
	return #ret
end

for i = 1, 999, 1 do
	local s = tostring(i)
	ret = ret + getNumAsNumOfLetters(s)
end

print(ret + #"one" + #"thousand")
