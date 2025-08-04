---@diagnostic disable: undefined-global
local collectgarbage = collectgarbage;
local gcinfo         = gcinfo;

local function newcollectgarbage(opt, arg)
	collectgarbage(arg);
	return gcinfo();
end

return newcollectgarbage;
