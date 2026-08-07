---@class FloweryLongLegsFlower : Bullet
local FloweryLongLegsFlower, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
function FloweryLongLegsFlower:init(x, y, dir, speed)
    super.init(self, SCREEN_WIDTH / 2, 50, "bullets/flowerylonglegs/flower")
    self.shoot_timer = 0
end
function FloweryLongLegsFlower:onCollide(soul) --stops bullet from disappearing when hitting the soul
    self.destroy_on_hit = false
    super.onCollide(self, soul)
end

function FloweryLongLegsFlower:update()
    self.rotation = self.rotation + 0.1
    super.update(self)
    self.shoot_timer = self.shoot_timer + DTMULT

    if self.shoot_timer >= 3.5 then
        self.shoot_timer = 0

        if self.wave then
            local pellet1 = self.wave:spawnBullet("pellet", self.x, self.y)
            local pellet2 = self.wave:spawnBullet("pellet", self.x, self.y)
            local pellet3 = self.wave:spawnBullet("pellet", self.x, self.y)
            local pellet4 = self.wave:spawnBullet("pellet", self.x, self.y)
            local pellet5 = self.wave:spawnBullet("pellet", self.x, self.y)
            pellet1.rotation = self.rotation - 90
            pellet1.physics.match_rotation = true
            pellet1.physics.speed = 5
            pellet2.rotation = self.rotation
            pellet2.physics.match_rotation = true
            pellet2.physics.speed = 5
            pellet3.rotation = self.rotation - 180
            pellet3.physics.match_rotation = true
            pellet3.physics.speed = 5
            pellet4.rotation = self.rotation + 45
            pellet4.physics.match_rotation = true
            pellet4.physics.speed = 5
            pellet5.rotation = self.rotation + 135
            pellet5.physics.match_rotation = true
            pellet5.physics.speed = 5
        end
    end
end

return FloweryLongLegsFlower
