---@class DirtFlowerTile : Event
local DirtFlowerTile, super = Class(Event)

function DirtFlowerTile:init(x, y)
    super.init(self, x, y, 40, 40)
    self:setSprite("tilesets/farm_world/garden/dirt_flower")

end

return DirtFlowerTile