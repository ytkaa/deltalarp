local ZobateRing, super = Class(Bullet)

function ZobateRing:init(x, y, speed, dir)
    super.init(self, x, y, "bullets/zobate/spiritring")
    self.extraneous_scaling = 1
    self.destroy_on_hit = false
    
    self.element = "entertainment"

    self.tp = 0.8 -- Half the default
    
    self.collider = CircleCollider(self, self.width/2, self.height/2, self.width/2)
    self:fadeOutAndRemove(1)
    print("Lmfao")

    if math.random() > 0.5 then
        self.orange_or_blue = "orange"
        self:setColor(ColorUtils.hexToRGB("#ffa040")) -- Use this for orange
    else
        self.orange_or_blue = "blue"
        self:setColor(ColorUtils.hexToRGB("#14a9ff")) -- Use this for BLUE!
    end
end

function ZobateRing:update()
    self.extraneous_scaling = self.extraneous_scaling + 0.3 * DTMULT
    self:setScale(self.extraneous_scaling)
    super.update(self)
end

-- Orange bullet (deal damage when the soul IS NOT moving)
function ZobateRing:onDamage(soul)
    -- Position of the center of the ring
    local dx = soul.x - self.x
    local dy = soul.y - self.y
    local distance = math.sqrt(dx * dx + dy * dy)

    -- Radius of the ring
    local radius = (self.width / 2) * self.extraneous_scaling

    -- How thick the ring's collision area is
    local thickness = 10

    -- Only damage if the soul is touching the ring itself
    if distance >= radius - thickness and distance <= radius + thickness then
        if self.orange_or_blue == "orange" then
            if not soul:isMoving() then
                return super.onDamage(self, soul)
            end
        elseif self.orange_or_blue == "blue" then
            if soul:isMoving() then
                return super.onDamage(self, soul)
            end
        end
    end

    -- Otherwise, no damage
    return {}
end

return ZobateRing