local mask3, super = Class(Wave)

function mask3:onStart()
    self.time = 12

    local zobate = self:getAttackers()[1]
    
    self.timer:everyInstant(1.75, function()
        local x, y = {200, 420}, {65, 270}
        local mask = self:spawnBullet("ZobateMask", x[1], Utils.pick(y, nil, math.random() > 0.5), 6)
        local mask2 = self:spawnBullet("ZobateMask", x[2], Utils.pick(y), 6)
        Assets.playSound("ghostappear")
    end)

end

function mask3:update()
    -- Code here gets called every frame

    super.update(self)
end

return mask3
