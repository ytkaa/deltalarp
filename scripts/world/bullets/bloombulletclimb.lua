---@class BloomBulletClimb : ClimbEnemy
local BloomBulletClimb, super = Class(ClimbEnemy)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
function BloomBulletClimb:init(x, y, dir, damage, iFrames, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/bloombullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed or 10 --12 for bloomer, 10 for bloomobe
    self.inv_frames = iFrames or Game:getDefaultInvulnFrames()
    self.damage = damage --25 for Bloomer, 12 for Bloomobe
    self.physics.match_rotation = false
    self.sprite:setRotationOrigin(0.5)
    self.collider = CircleCollider(self, self.width/2, self.height/2, self.width/2)
    self.remove_offscreen = true

    self.element = "plant"
end

function BloomBulletClimb:update()
    self.sprite.rotation = self.sprite.rotation + 0.4

    super.update(self)

    if not self.world.in_battle_area then self:fadeOutSpeedAndRemove(0.25) end
end

return BloomBulletClimb
