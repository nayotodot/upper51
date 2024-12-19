if not debug then return {}; end
return {
	debug        = debug.debug,
	getfenv      = debug.getfenv,
	gethook      = debug.gethook,
	getinfo      = debug.getinfo,
	getlocal     = debug.getlocal,
	getmetatable = debug.getmetatable,
	getregistry  = debug.getregistry,
	getupvalue   = debug.getupvalue,
	setfenv      = debug.setfenv,
	sethook      = debug.sethook,
	setlocal     = debug.setlocal,
	setmetatable = debug.setmetatable,
	setupvalue   = debug.setupvalue,
	traceback    = debug.traceback,
};
