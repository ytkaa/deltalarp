local mask1, super = Class(Wave)

function mask1:onStart()
    self.time = 12

    self.zobate = self:getAttackers()[1]

    self.timer:everyInstant(1.75, function()
        local x, y = Utils.pick({200, 420}), Utils.pick({65, 270})
        local mask = self:spawnBullet("ZobateMask", x, y, 5)
        Assets.playSound("ghostappear")
    end)

end

function mask1:update()
    -- Code here gets called every frame
    self.zobate:float_override()
    super.update(self)
end

return mask1
