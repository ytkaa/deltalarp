local kipkipchase, super = Class(Wave)

function kipkipchase:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 10
end

function kipkipchase:onStart()
    -- Get all enemies that selected this wave as their attack
    local kipkips = self:getAttackers()

    for _, kipkip in ipairs(kipkips) do
        local bullet2 = self:spawnBullet("kipkipchase", math.random(249, 391), math.random(100, 100))
        bullet2:setScale(1.75)
    end
end

function kipkipchase:update()

    super.update(self)
end

return kipkipchase