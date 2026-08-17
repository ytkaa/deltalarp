local ZobateBolt, super = Class(Bullet)

function ZobateBolt:init(x, y, speed, dir)
    super.init(self, x, y, "bullets/zobate/spirit_z")
    
    self.element = "entertainment"
    
    self.sprite:setRotationOrigin(0.5)

    self.physics.direction = dir
    self.sprite.rotation = dir

    self.physics.speed = speed

    self.tp = 3.2 --Double the default
end

function ZobateBolt:update()
    super.update(self)
end

return ZobateBolt