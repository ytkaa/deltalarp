local orange_test, super = Class(Wave)

function orange_test:onStart()
    self.time = 12

    local zobate = self:getAttackers()[1]

    local x, y = zobate:getRelativePos(zobate.width / 2, zobate.height / 2)

    -- Lowest we can go here and still have it fair is 1 second.
    self.timer:everyInstant(1.5, function()
        self:spawnBullet("ZobateStars", x, y, 0)
    end)

    local soul = OrangeSoul()
    Game.battle:swapSoul(soul)

end

function orange_test:update()
    -- Code here gets called every frame

    super.update(self)
end

return orange_test
