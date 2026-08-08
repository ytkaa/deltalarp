---@class RacingActivate : Event
local RacingActivate, super = Class(Interactable)

function RacingActivate:init(x, y, properties)
    super.init(self, x, y, nil, properties)
    self:setSprite("tilesets/farm_world/garden/dirt_flower")
    self.solid = true
    self.once = true
end

function RacingActivate:onInteract(player, dir)
    Assets.playSound("ui_spooky_action")
    local racing = Racing()
    Game.stage:addChild(racing)
    Game.lock_movement = true
    return true
end

return RacingActivate