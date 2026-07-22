local GONER_0, super = Class(Map)

function GONER_0:onEnter()
    Game:setFlag("GONER_0", true)
end;

function GONER_0:onExit()
    Game.inventory:addItem("key")
end;

return GONER_0