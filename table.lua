---@diagnostic disable: deprecated, undefined-field
if not table then return {}; end
local next = next;
local type = type;

local function maxn(list)
	local max = 0;
	local i = next(list);
	while i do
		if type(i) == "number" and i > max then
			max = i;
		end
		i = next(list, i);
	end
	return max;
end

return {
	concat   = table.concat,
	insert   = table.insert,
	maxn     = maxn,
	remove   = table.remove,
	sort     = table.sort,

	-- Deprecated in Lua 5.1
	foreach  = table.foreach,
	foreachi = table.foreachi,
	getn     = table.getn,
	setn     = table.setn,
};
