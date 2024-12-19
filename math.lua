if not math then return {}; end
local abs   = math.abs;
local ceil  = math.ceil;
local exp   = math.exp;
local floor = math.floor;

local function modf(x)
	local ip = x < 0 and ceil(x) or floor(x);
	return ip, (x == ip) and (0.0) or (x - ip);
end

-- cosh, sinh, tanh: http://lua-users.org/wiki/HyperbolicFunctions
local function cosh(x)
	if x == 0 then
		return 1;
	end
	local x = exp(abs(x));
	return x / 2.0 + 0.5 / x;
end

local function sinh(x)
	if x == 0 then
		return 0;
	end
	local sign = x < 0 and -1 or 1;
	local x = x * sign;
	if x < 1 then
		local y = x * x;
		x = x + x * y * (((-0.78966127417357099479e0 * y + -0.16375798202630751372e3) * y + -0.11563521196851768270e5) * y + -0.35181283430177117881e6) /
			(((0.10000000000000000000e1 * y + -0.27773523119650701667e3) * y + 0.36162723109421836460e5) * y + -0.21108770058106271242e7);
	else
		x = exp(x);
		x = x / 2.0 + 0.5 / x;
	end
	return x * sign;
end

local function tanh(x)
	if x == 0 then
		return 0;
	end
	local sign = x < 0 and -1 or 1;
	local x = x * sign;
	if x < 0.54930614433405 then
		local y = x * x;
		x = x + x * y * ((-0.96437492777225469787e0 * y + -0.99225929672236083313e2) * y + -0.16134119023996228053e4) /
			(((0.10000000000000000000e1 * y + 0.11274474380534949335e3) * y + 0.22337720718962312926e4) * y + 0.48402357071988688686e4);
	else
		x = exp(x);
		x = 1.0 - 2.0 / (x * x + 1.0);
	end
	return x * sign;
end

return {
	abs        = math.abs,
	acos       = math.acos,
	asin       = math.asin,
	atan       = math.atan,
	atan2      = math.atan2,
	ceil       = math.ceil,
	cos        = math.cos,
	cosh       = cosh,
	deg        = math.deg,
	exp        = math.exp,
	floor      = math.floor,
	fmod       = math.mod,
	frexp      = math.frexp,
	huge       = tonumber("inf"),
	ldexp      = math.ldexp,
	log        = math.log,
	log10      = math.log10,
	max        = math.max,
	min        = math.min,
	modf       = modf,
	pi         = math.pi,
	pow        = math.pow,
	rad        = math.rad,
	random     = math.random,
	randomseed = math.randomseed,
	sin        = math.sin,
	sinh       = sinh,
	sqrt       = math.sqrt,
	tan        = math.tan,
	tanh       = tanh,

	-- Renamed in Lua 5.1
	mod        = math.mod,
};
