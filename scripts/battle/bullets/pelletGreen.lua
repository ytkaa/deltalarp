---@class pelletGreen : Bullet
local pelletGreen, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
function pelletGreen:init(x, y)
    super.init(self, x, y, "bullets/flowerylonglegs/bloombullet")
    self:setColor(COLORS.lime) 

    self.element = "plant"
end

function pelletGreen:onCollide(soul)
    for _, party in ipairs(Game.battle.party) do
        party:heal(5)
    end
    self:remove()
end

return pelletGreen