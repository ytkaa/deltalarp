local ZobateStar, super = Class(Bullet)

function ZobateStar:init(x, y)
    super.init(self, x, y, "bullets/zobate/star")
    
    self.element = "entertainment"

    self.spinning = false

    self.destroy_on_hit = false
end

function ZobateStar:update()
    super.update(self)
    if self.spinning then
        self.sprite.rotation = self.sprite.rotation + 0.4 * DTMULT
    end
end

return ZobateStar