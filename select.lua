---@diagnostic disable: deprecated
local unpack = require "unpack";

local getn   = table.getn;

local function select(index, ...)
	local n = getn(arg);
	if index == "#" then
		return n;
	else
		return unpack(arg, index < 0 and (n + (index + 1)) or index);
	end
end

return select;
