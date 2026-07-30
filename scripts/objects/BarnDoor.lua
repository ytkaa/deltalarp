---@class BarnDoor : Event
local BarnDoor, super = Class(Event)

function BarnDoor:init(x, y)
    super.init(self, x, y, 188, 210)
    self:setSprite("tilesets/rural/barn_door_closed")
    self.solid = false
end

return BarnDoor