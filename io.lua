if not io then return {}; end
return {
	close   = io.close,
	flush   = io.flush,
	input   = io.input,
	lines   = io.lines,
	open    = io.open,
	output  = io.output,
	popen   = io.popen,
	read    = io.read,
	stderr  = io.stderr,
	stdin   = io.stdin,
	stdout  = io.stdout,
	tmpfile = io.tmpfile,
	type    = io.type,
	write   = io.write,
};
