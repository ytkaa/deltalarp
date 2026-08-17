local ZobateRing, super = Class(Bullet)

function ZobateRing:init(x, y, speed, dir)
    super.init(self, x, y, "bullets/zobate/spiritring")
    self.Goofyahh = 1
    self.destroy_on_hit = false
    
    self.element = "entertainment"
    
    self.collider = CircleCollider(self, self.width/2, self.height/2, self.width/2)
    self:fadeOutAndRemove(1)
    print("Lmfao")
    self:setColor(ColorUtils.hexToRGB("#ffa040")) -- Use this for orange
end

function ZobateRing:update()
    self.Goofyahh = self.Goofyahh + 0.3
    self:setScale(self.Goofyahh)
    super.update(self)
end

-- Orange bullet (deal damage when the soul IS NOT moving)
function ZobateRing:onDamage(soul)
    -- Position of the center of the ring
    local dx = soul.x - self.x
    local dy = soul.y - self.y
    local distance = math.sqrt(dx * dx + dy * dy)

    -- Radius of the ring
    local radius = (self.width / 2) * self.Goofyahh

    -- How thick the ring's collision area is
    local thickness = 10

    -- Only damage if the soul is touching the ring itself
    if distance >= radius - thickness and distance <= radius + thickness then
        if not soul:isMoving() then
            return super.onDamage(self, soul)
        end
    end

    -- Otherwise, no damage
    return {}
end

return ZobateRing