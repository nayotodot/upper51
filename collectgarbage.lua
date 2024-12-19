local collectgarbage = collectgarbage;
local gcinfo         = gcinfo;

local function newcollectgarbage(opt, arg)
	-- if opt == "stop" then
	-- elseif opt == "restart" then
	-- elseif opt == "collect" then
	-- elseif opt == "count" then
	-- elseif opt == "step" then
	-- elseif opt == "setpause" then
	-- elseif opt == "setstepmul" then
	-- end
	collectgarbage(arg);
	return gcinfo();
end

return newcollectgarbage;
