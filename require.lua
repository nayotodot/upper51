local package = require "package";
local string  = require "string";

local error = error;
local pcall = pcall;
local type  = type;

local searchers = package.searchers;
local loaded    = package.loaded;

local format = string.format;

local function findloader(name)
	if type(searchers) ~= "table" then
		error("'package.searchers' must be a table", 3);
	end
	local i = 1;
	local msg = "";
	while searchers[i] do
		local f, filename = searchers[i](name);
		if type(f) == "function" then
			return f, filename;
		elseif type(f) == "string" then
			msg = msg .. "\n\t" .. f;
		end
		i = i + 1;
	end
	error(format("module '%s' not found:%s", name, msg), 3);
end

local function require(name)
	if loaded[name] ~= nil then
		return loaded[name];
	end
	local loader, filename = findloader(name);
	local status, result = pcall(loader, name, filename);
	if status == false then
		error(result, 2);
	end
	if result == nil then
		result = true;
	end
	loaded[name] = result;
	return result, filename;
end

return require;
