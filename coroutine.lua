if not coroutine then return {}; end
return {
	create  = coroutine.create,
	resume  = coroutine.resume,
	running = coroutine.running,
	status  = coroutine.status,
	wrap    = coroutine.wrap,
	yield   = coroutine.yield,
};
