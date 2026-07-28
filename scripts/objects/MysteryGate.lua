---@class MysteryGate : Event
local MysteryGate, super = Class(Event)

function MysteryGate:init(x, y)
    super.init(self, x, y, 80, 80)
    self:setSprite("world/events/gate2")
    self.solid = true
end

function MysteryGate:onInteract(player, dir)
    Game.world:showText({"* (A mysterious gate...)", "* (It's locked.[sound:awkward])"})
end

return MysteryGate