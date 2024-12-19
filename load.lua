local string = require "string";

local error      = error;
-- local getfenv    = getfenv;
local loadstring = loadstring;
local pcall      = pcall;
-- local setfenv    = setfenv;
local type       = type;

local dump   = string.dump;
local format = string.format;

local function load(func, chunkname)
	local chunk;
	if type(func) == "function" then
		local status, result = pcall(func);
		if not status then
			return nil, result;
		elseif type(result) == "string" then
			chunk = result;
			for s in func do
				chunk = chunk .. "\n" .. s;
			end
		elseif type(result) == "nil" then
			chunk = dump(func);
		end
	else
		error(format("bad argument #1 to 'load' (function expected, got %s)", type(func)), 2);
	end
	if not chunk then
		return nil, "attempt to call a nil value";
	end
	local f, err = loadstring(chunk, chunkname);
	if not f then
		return f, err;
	end
	-- setfenv(f, getfenv(2));
	return f;
end

return load;
