if not os then return {}; end
return {
	clock     = os.clock,
	date      = os.date,
	difftime  = os.difftime,
	execute   = os.execute,
	exit      = os.exit,
	getenv    = os.getenv,
	remove    = os.remove,
	rename    = os.rename,
	setlocale = os.setlocale,
	time      = os.time,
	tmpname   = os.tmpname,
};
