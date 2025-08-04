---@diagnostic disable: deprecated
local getn = table.getn;

local function unpack(list, i, j)
	i = i or 1;
	j = j or getn(list);
	if i <= j then
		return list[i], unpack(list, i + 1, j);
	end
end

return unpack;
