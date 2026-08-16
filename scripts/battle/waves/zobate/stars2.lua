local stars2, super = Class(Wave)

function stars2:onStart()
    self.time = 12

    local zobate = self:getAttackers()[1]

    local x, y = zobate:getRelativePos(zobate.width / 2, zobate.height / 2)

    -- Lowest we can go here and still have it fair is 1 second.
    self.timer:everyInstant(1.2, function()
        local side = math.random(0, 1)
        local sprite = "star_right"
        local offset = 25

        if side == 1 then sprite = "star_left" offset = -1 * offset end
        self:spawnBullet("ZobateStars", x, y, side)

        zobate:setSprite(sprite)
        zobate:slideTo(zobate.x - offset, zobate.y, 0.15, "linear", function() 
            zobate:slideTo(zobate.x + offset, zobate.y, 0.15, "linear", function() zobate:setSprite("aura_goku") end) 
        end)
    end)

end

function stars2:update()
    -- Code here gets called every frame

    super.update(self)
end

return stars2
