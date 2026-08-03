---@class Bloomer : Event
---@field group     integer     *[property `group`]* Which trigger activates this
local Bloomer, super = Class(Event)

function Bloomer:init(x, y, properties)
    super.init(self, x, y, 40, 80)
    self:setSprite("world/events/bloomer/idle", 1/math.random(2, 6))
    self.solid = true
    self:setOrigin(0.50, 0.8)
    self.group = properties["group"] or 1
end

return Bloomer