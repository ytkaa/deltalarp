local kame1, super = Class(Wave)

function kame1:onStart()
    self.time = 21

    self.charge_sound = Assets.newSound("chargeshot_charge")
    self.charge_sound:setLooping(true)

    self.delay = 1 --Lowest we can do here is 100 without being unfair, default is 360

    self.loose = false

    self.timer:tween(0.5, self, {arena_width = 200}, "linear")

    local zobate = self:getAttackers()[1]

    local zah_ha_ha

    zobate.sprite:slideTo(0, 3.5, 1, "out-quad")
    zobate.overlay_sprite:slideTo(0, 3.5, 1, "out-quad")

    self.timer:after(1.5, function()
        Assets.playSound("wing")
        zobate:setSprite("kame", 1.3, false)
        
    end)

    self.timer:after(2, function()
        zah_ha_ha = Assets.playSound("zobate_kame_zah")
        --shake
        self.charge_sound:play()
        local kame_ball = Sprite("bullets/zobate/kame_ball", 14, 40)
        kame_ball:setScaleOrigin(0.5)
        kame_ball:setOrigin(0.5)
        kame_ball:setScale(0.1)
        zobate:addChild(kame_ball)
        self.timer:tween(1, kame_ball, {scale_x = 1, scale_y = 1}, "linear", function()
            kame_ball:slideTo(kame_ball.x, kame_ball.y + 4, 0.6, "out-cubic")
            self.timer:after(0.8, function()
                zobate.sprite:stop(true)
                self.charge_sound:stop()
                local x,y = kame_ball:getScreenPos()
                local kame = self:spawnBullet("ZobateKame", x, y - 5)
                kame:setOrigin(0.5, 0)
                kame:setScaleOrigin(0.5, 0)
                kame_ball:remove()
            end)
        end)
    end)

end

function kame1:repetition()
    local zobate = self:getAttackers()[1]

    zobate:setSprite("aura_goku")

    zobate.sprite:slideTo(0, 0, 1, "out-quad")
    zobate.overlay_sprite:slideTo(0, 0, 1, "out-quad")
    
    self.timer:after(self.delay, function()
        zobate:slideTo(Game.battle.soul.x, zobate.y, 0.5, "out-cubic")
        zobate.sprite:slideTo(0, 3.5, 0.5, "out-cubic")
        zobate.overlay_sprite:slideTo(0, 3.5, 0.5, "out-cubic")
        self.timer:after(0.5, function()
            Assets.playSound("wing")
            zobate:setSprite("kame", 0.5, false)

            self.timer:after(0.5, function()
                local kame_ball = Sprite("bullets/zobate/kame_ball", 14, 44)
                kame_ball:setScaleOrigin(0.5)
                kame_ball:setOrigin(0.5)
                zobate:addChild(kame_ball)
                zobate.sprite:stop(true)
                local x,y = kame_ball:getScreenPos()
                local kame = self:spawnBullet("ZobateKame", x, y - 5)
                kame:setOrigin(0.5, 0)
                kame:setScaleOrigin(0.5, 0)
                kame_ball:remove()
            end)
        end)
    end)
end

function kame1:onArenaEnter()
    super.onArenaEnter(self)

    self:setArenaSize(200, 142)
end

function kame1:update()
    -- Code here gets called every frame
    if self.loose then
        local zobate = self:getAttackers()[1]
        zobate:setSprite("aura_goku")
        zobate:float_override()
    end

    if Game.battle.soul then
        Game.battle.soul.speed = 5 --Higher soul speed to help with dodging
    end

    super.update(self)
end

function kame1:onArenaExit()
    super.onArenaExit(self)

    local zobate = Game.battle.enemies[1]

    zobate:setSprite("aura_goku")
    zobate:slideTo(320, 90, 0.5, "out-cubic")
end

return kame1
