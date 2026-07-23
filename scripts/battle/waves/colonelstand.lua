local colonelstand, super = Class(Wave)

function colonelstand:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 10
    local standing
end

function colonelstand:onStart()
    local x, y = Game.battle.arena:getCenter()
    local enemies = self:getAttackers()
    local bullet = self:spawnBullet("bullets/colonel/standing", x, (y + 55))
    bullet.destroy_on_hit = false
end

function colonelstand:update()
    super.update(self)
end

return colonelstand