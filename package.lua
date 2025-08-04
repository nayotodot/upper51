---@diagnostic disable: deprecated, undefined-global
local error        = error;
local getfenv      = getfenv;
local loadfile     = loadfile;
local setmetatable = setmetatable;
local type         = type;

local close        = io.close;
local open         = io.open;

local find         = string.find;
local format       = string.format;
local gsub         = string.gsub;
local len          = string.len;
local sub          = string.sub;

local LUA_PATH_SEP  = ";";
local LUA_PATH_MARK = "?";
local LUA_EXEC_DIR  = "!";

local LUA_PATH_DEFAULT  = "./?.lua;./?/init.lua";
local LUA_CPATH_DEFAULT = "./?.so";

local LUA_IGMARK = "-";
local LUA_DIRSEP = "/";

local package = {};
local preload = {};

local function readable(filename)
	local f = open(filename);
	if f then
		close(f);
		return true;
	end
	return false;
end

local function getnextfilename(path)
	local i = 1;
	local n = len(path);
	return function()
		if i < n then
			local from, to = find(path, LUA_PATH_SEP, i);
			local result = sub(path, i, from and (from - 1) or n);
			i = to and (to + 1) or n;
			return result;
		end
	end;
end

local function pusherrornotfound(path)
	local s = "no file '";
	s = s .. gsub(path, LUA_PATH_SEP, "'\n\tno file '");
	s = s .. "'";
	return s;
end

local function searchpath(name, path, sep, dirsep)
	if name and find(name, sep) then
		name = gsub(name, sep, dirsep);
	end
	path = gsub(path, LUA_PATH_MARK, name);
	for filename in getnextfilename(path) do
		if readable(filename) then
			return filename;
		end
	end
	return nil, pusherrornotfound(path);
end

local function findfile(name, pname, dirsep)
	local path = package[pname];
	if type(path) ~= "string" then
		error(format("'package.%s' must be a string", pname), 5);
	else
		return searchpath(name, path, "%.", dirsep);
	end
end

local function checkload(stat, name, filename, msg)
	if stat then
		return stat, filename;
	else
		error(format("error loading module '%s' from file '%s':\n\t%s", name, filename, msg), 5);
	end
end

local function searcher_Lua(name)
	local filename, msg = findfile(name, "path", LUA_DIRSEP);
	if filename == nil then
		return msg;
	end
	local f, msg = loadfile(filename);
	return checkload(f, name, filename, msg);
end

local function loadfunc() end

local function searcher_C()
	-- local filename, msg = findfile(name, "cpath", LUA_DIRSEP);
	-- if filename == nil then
	-- 	return msg;
	-- end
	-- local f, msg = loadfunc(filename);
	-- return checkload(f, name, filename, msg);
end

local function searcher_Croot() end

local function searcher_preload(name)
	if preload[name] == nil then
		return format("no field package.preload['%s']", name);
	else
		return preload[name], ":preload:";
	end
end

local searchers = { searcher_preload, searcher_Lua, searcher_C, searcher_Croot };
local function seeall(ns)
	local metatable = {
		__index = getfenv()
	};
	setmetatable(ns, metatable);
end

package.config     = LUA_DIRSEP .. "\n" .. LUA_PATH_SEP .. "\n" .. LUA_PATH_MARK .. "\n" .. LUA_EXEC_DIR .. "\n" .. LUA_IGMARK .. "\n";
package.cpath      = LUA_CPATH_DEFAULT;
package.loaded     = {};
package.loadlib    = loadlib;
package.path       = LUA_PATH_DEFAULT;
package.preload    = preload;
package.searchers  = searchers;
package.searchpath = searchpath;

-- Renamed in Lua 5.2
package.loaders    = searchers;

-- Removed in Lua 5.2
package.seeall     = seeall;

return package;
