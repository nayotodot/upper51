local table = require "table";

local getn = table.getn;

local function unpack(list, i, j)
	local i = i or 1;
	local j = j or getn(list);
	if i <= j and list[i] then
		return list[i], unpack(list, i + 1, j);
	end
end

return unpack;
