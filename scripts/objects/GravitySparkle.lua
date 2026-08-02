---@class GravitySparkle : Sprite
---@overload fun(...) : GravitySparkle
local GravitySparkle, super = Class(Sprite)

function GravitySparkle:init(x, y, scale, gravity)
    super.init(self, "effects/spare/star", x, y)

    self:play(0.25, true)

    self:setColor(1, 1, 1)
    self:setOrigin(0.5, 0.5)
    self:setScale(scale)

    self:fadeOutSpeedAndRemove(0.1)

    self.physics.gravity = gravity
    self.physics.friction = 0.05

    self.alpha = 2
    self.spin = 10
end

function GravitySparkle:update()
    self.rotation = self.rotation + math.rad(self.spin) * DTMULT

    super.update(self)
end

return GravitySparkle
