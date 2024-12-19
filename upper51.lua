local libs = require "base";

libs._G        = libs;
libs._VERSION  = "Lua 5.0";
libs.coroutine = require "coroutine";
libs.debug     = require "debug";
libs.io        = require "io";
libs.math      = require "math";
libs.os        = require "os";
libs.package   = require "package";
libs.string    = require "string";
libs.table     = require "table";

libs.package.loaded = {
	_G        = libs._G,
	coroutine = libs.coroutine,
	debug     = libs.debug,
	io        = libs.io,
	math      = libs.math,
	os        = libs.os,
	package   = libs.package,
	string    = libs.string,
	table     = libs.table,
}

return libs;
