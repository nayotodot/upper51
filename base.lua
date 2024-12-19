local collectgarbage = require "collectgarbage";
local load           = require "load";
local module         = require "module";
local newrequire     = require "require";
local select         = require "select";
local unpack         = require "unpack";

return {
	assert         = assert,
	collectgarbage = collectgarbage,
	dofile         = dofile,
	error          = error,
	getfenv        = getfenv,
	getmetatable   = getmetatable,
	ipairs         = ipairs,
	load           = load,
	loadfile       = loadfile,
	loadstring     = loadstring,
	module         = module,
	newproxy       = newproxy,
	next           = next,
	pairs          = pairs,
	pcall          = pcall,
	print          = print,
	rawequal       = rawequal,
	rawget         = rawget,
	rawset         = rawset,
	require        = newrequire,
	select         = select,
	setfenv        = setfenv,
	setmetatable   = setmetatable,
	tonumber       = tonumber,
	tostring       = tostring,
	type           = type,
	unpack         = unpack,
	xpcall         = xpcall,
};
