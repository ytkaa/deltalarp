---@class RacingActivateNew : Event
local RacingActivateNew, super = Class(Interactable)

function RacingActivateNew:init(x, y, properties)
    super.init(self, x, y, nil, properties)
    self:setSprite("tilesets/farm_world/garden/dirt_flower")
    self.solid = true
end

function RacingActivateNew:onInteract(player, dir)
    --Assets.playSound("ui_spooky_action")
    if not player:isRacing() then
        player:setState("RACING")
        Game.world:showText("* Race !!!")
    elseif player:isRacing() then
        player:setState("WALK")
    end
    return true
end

return RacingActivateNew