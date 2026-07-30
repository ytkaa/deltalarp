---@class DarkSmoke : Sprite
local DarkSmoke, super = Class(Sprite)

function DarkSmoke:init(x, y, decay)
    super.init(self, "dark_smoke", x, y, 50, 50)
    --self:setSprite("dark_smoke")
    self:setScale(math.random() * (1.75 - 0.6) + 0.6)
    --self:fadeOutAndRemove(7)
    Game.world.timer:after(decay, function()
        self:remove()
    end)
end

return DarkSmoke