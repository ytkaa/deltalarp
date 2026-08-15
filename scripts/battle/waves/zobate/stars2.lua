local stars2, super = Class(Wave)

function stars2:onStart()
    self.time = 12

    local zobate = self:getAttackers()[1]

    local x, y = zobate:getRelativePos(zobate.width / 2, zobate.height / 2)

    -- Lowest we can go here and still have it fair is 1 second.
    self.timer:everyInstant(1.2, function()
        self:spawnBullet("ZobateStars", x, y, math.random(0, 1))
    end)

end

function stars2:update()
    -- Code here gets called every frame

    super.update(self)
end

return stars2
