if not string then return {}; end
local byte = string.byte;
local find = string.find;
local len  = string.len;
local sub  = string.sub;

local function newbyte(s, i, j)
	i = i or 1;
	j = j or i;
	if i <= j then
		return byte(s, i), newbyte(s, i + 1, j);
	end
end

local function match(s, pattern, init)
	local from, to = find(s, pattern, init);
	if from then
		return sub(s, from, to);
	end
	return nil;
end

local function reverse(s)
	local str = "";
	for i = len(s), 1, -1 do
		str = str .. sub(s, i, i);
	end
	return str;
end

return {
	byte    = newbyte,
	char    = string.char,
	dump    = string.dump,
	find    = string.find,
	format  = string.format,
	gmatch  = string.gfind,
	gsub    = string.gsub,
	len     = string.len,
	lower   = string.lower,
	match   = match,
	rep     = string.rep,
	reverse = reverse,
	sub     = string.sub,
	upper   = string.upper,

	-- Renamed in Lua 5.1
	gfind   = string.gfind,
};
