local spirit1, super = Class(Wave)

function spirit1:onStart()
    self.time = -1

    self.charge_sound = Assets.newSound("chargeshot_charge")
    self.charge_sound:setLooping(true)

    self.delay = 360 --Lowest we can do here is 100 without being unfair

    self.loose = false

    local zobate = self:getAttackers()[1]

    zobate.sprite:slideTo(0, 3.5, 1, "out-quad")
    zobate.overlay_sprite:slideTo(0, 3.5, 1, "out-quad")

    self.timer:after(2, function()
        Assets.playSound("wing")
        zobate:setSprite("spirit_charge", 1/4, false)
    end)

    self.timer:after(2.5, function()
        zobate:setSprite("spirit_charge", 1/4, true)
        self.charge_sound:play()
        local spirit = Sprite("bullets/zobate/spiritbomb", 15, 3)
        spirit:setScaleOrigin(0.5, 1)
        spirit:setScale(0.1)
        zobate:addChild(spirit)
        self.timer:tween(3, spirit, {scale_x = 1, scale_y = 1}, "linear", function()
            zobate.sprite:stop(true)
            self.charge_sound:stop()
            Assets.playSound("noise")

            self.timer:after(1, function()
                Assets.playSound("wing")
                zobate:setSprite("spirit_throw")
                spirit:slideTo(150, spirit.y + 75, 1, "out-cubic", function()
                    local x, y = spirit:getScreenPos()
                    print(spirit:getScreenPos())
                    local spiritB = self:spawnBullet("ZobateSpirit", x, y, "right")
                    spirit:remove()
                end)
            end)
        end)
    end)

end

function spirit1:update()
    -- Code here gets called every frame
    if self.loose then
        local zobate = self:getAttackers()[1]
        zobate:setSprite("aura_goku")
        zobate:float_override()
    end
    super.update(self)
end

return spirit1
