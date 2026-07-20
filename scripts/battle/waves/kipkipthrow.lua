local kipkipthrow, super = Class(Wave)

function kipkipthrow:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 10
    kipkipThrowSpeed = 0.5
    kipkipBulletSpeed = 4
    local bullet
end

function kipkipthrow:onStart()
    local kipkip = self:getAttackers()[1] --grab enemy pos
    --local x = SCREEN_WIDTH / 2 
    --local y = SCREEN_HEIGHT / 2 position is the middle of the screen

    if kipkip.kipkipAgitated then
        kipkipThrowSpeed = 0.25
        kipkipBulletSpeed = 6
    end
    self.timer:everyInstant(kipkipThrowSpeed, function()
        local x, y = kipkip:getRelativePos(kipkip.width/2, kipkip.height/2) -- position is the enemy pos
        local kipkipbullet = Utils.pick({"bullets/kipkip/brick", "bullets/kipkip/rake", "bullets/kipkip/watering_can", "bullets/kipkip/flower"}) --grabs random sprite from the following!
        local target_angle = MathUtils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
        bullet = self:spawnBullet(kipkipbullet, x, y)
        bullet.rotation = target_angle + math.rad(MathUtils.random(-20, 20))
        bullet.physics.match_rotation = true
        bullet.physics.speed = kipkipBulletSpeed
    end)
end

function kipkipthrow:update()
    --bullet.rotation = bullet.rotation + 0.1 Too Difficult to figure out so WHo cares.

    super.update(self)
end

return kipkipthrow