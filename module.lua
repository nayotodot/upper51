local package = require "package";
local string  = require "string";
local table   = require "table";

local error   = error;
local getfenv = getfenv;
local setfenv = setfenv;
local type    = type;

local loaded = package.loaded;

local format = string.format;
local gmatch = string.gmatch;
local gsub   = string.gsub;

local getn = table.getn;

local function findtable(t, f)
	for w in gmatch(f, "[%w_]+") do
		if not t[w] then
			return t[w];
		end
		t = t[w];
	end
	return t;
end

local function module(modname, ...)
	local ns = loaded[modname];
	if type(ns) ~= "table" then
		ns = findtable(getfenv(), modname);
		if ns == nil then
			error(format("name conflict for module '%s'", modname), 2);
		end
	end
	if ns._NAME == nil then
		ns._M = ns;
		ns._NAME = modname;
		ns._PACKAGE = gsub(modname, "[^.]*$", "");
	end
	setfenv(2, ns);
	for i = 1, getn(arg) do
		arg[i](ns);
	end
end

return module;
