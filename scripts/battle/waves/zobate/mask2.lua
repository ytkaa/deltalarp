local mask2, super = Class(Wave)

function mask2:onStart()
    self.time = 12

    self.zobate = self:getAttackers()[1]
    
    self.timer:everyInstant(1.75, function()
        local x, y = {200, 420}, Utils.pick({65, 270})
        local mask = self:spawnBullet("ZobateMask", x[1], y, 6)
        local mask2 = self:spawnBullet("ZobateMask", x[2], y, 6)
        Assets.playSound("ghostappear")
    end)

end

function mask2:update()
    -- Code here gets called every frame

    self.zobate:float_override()

    super.update(self)
end

return mask2
