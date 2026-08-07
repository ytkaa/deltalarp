---@class pellet : Bullet
local pellet, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
function pellet:init(x, y)
    super.init(self, x, y, "bullets/flowerylonglegs/bloombullet")
end

return pellet