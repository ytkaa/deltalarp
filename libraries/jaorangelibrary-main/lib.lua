local Lib = {}

function Lib:init()
    BATTLE_LAYERS = {
    ["bottom"]         = -1000,
    ["background"]     = -750,
    ["darkener"]       = -500,
    ["below_battlers"] = -200,
    ["battlers"]       = -100,
    ["above_battlers"] = 0, --┰-- 0
    ["below_ui"]       = 0, --┙
    ["ui"]             = 100,
    ["damage_numbers"] = 350, --150,
    ["above_ui"]       = 200, --┰-- 200
    ["below_arena"]    = 200, --┙
    ["arena"]          = 300,
	["tp_bar"]		   = 325,
    ["above_arena"]    = 400, --┰-- 400
    ["below_soul"]     = 400, --┙
    ["soul"]           = 500,
    ["above_soul"]     = 600, --┰-- 600
    ["below_bullets"]  = 600, --┙
    ["bullets"]        = 700,
    ["above_bullets"]  = 800,
    ["top"]            = 1000
	}
end

function Lib:cleanup()
	BATTLE_LAYERS = {
    ["bottom"]         = -1000,
    ["background"]     = -750,
    ["darkener"]       = -500,
    ["below_battlers"] = -200,
    ["battlers"]       = -100,
    ["above_battlers"] = 0, --┰-- 0
    ["below_ui"]       = 0, --┙
    ["ui"]             = 100,
    ["damage_numbers"] = 150,
    ["above_ui"]       = 200, --┰-- 200
    ["below_arena"]    = 200, --┙
    ["arena"]          = 300,
    ["above_arena"]    = 400, --┰-- 400
    ["below_soul"]     = 400, --┙
    ["soul"]           = 500,
    ["above_soul"]     = 600, --┰-- 600
    ["below_bullets"]  = 600, --┙
    ["bullets"]        = 700,
    ["above_bullets"]  = 800,
    ["top"]            = 1000
	}
end

return Lib