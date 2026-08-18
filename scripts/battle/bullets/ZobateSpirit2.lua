local ZobateSpirit2, super = Class(Bullet)

function ZobateSpirit2:init(x, y, side)
    super.init(self, x, y, "bullets/zobate/spiritbomb")
    
    self.element = "entertainment"

    self.destroy_on_hit = false

    self.bouncing = false

    self.side = side

    self:setOrigin(0)

    self.remove_offscreen = false

    self.collider = CircleCollider(self, self.width/2, self.height/2, self.width/2)

    self.charge_sound = Assets.newSound("chargeshot_charge")
    self.charge_sound:setLooping(true)
    --self.charge_sound:play()
    self.initial_y = 175 --Christ
    self.random_y = 0
    self.timer = Timer()

    Assets.playSound("stardrop")

    if self.side == "right" then
        self.physics.speed = 1
        self.physics.direction = math.pi
    else
        self.physics.speed = 1
        self.physics.direction = 0
    end
end

function ZobateSpirit2:update()
    local arena = Game.battle.arena
    local collided,thing = Game.battle:checkSolidCollision(self)

    super.update(self)
    if self.side == "right" and collided and not self.bouncing then
        self.physics.direction = 0
        self.bouncing = true
        --self:fadeOutAndRemove(0.5)
        arena:slideTo(320 - 80, arena.y, 1.5, "out-quad") --Slower slide to account for Ring

        self.charge_sound:stop()
        Assets.playSound("bomb")
        self.wave.loose = true

        --local angle = MathUtils.angle(self.x, self.random_y, Game.battle.soul.x, Game.battle.soul.y)
        local offset = 14
        local y = self.y + offset

        self.wave:spawnBullet("ZobateBolt", self.x + offset, y, 12, math.pi)
        self.wave:spawnBullet("ZobateBolt", self.x + offset, y, 12, math.rad(150))
        self.wave:spawnBullet("ZobateBolt", self.x + offset, y, 12, math.rad(210))
        self.wave:spawnBullet("ZobateRing", self.x + offset, y, 12, math.pi) --made this randomly orange or blue

        self.delay = self.wave.delay

    elseif self.side == "left" and collided and not self.bouncing then
        self.physics.direction = math.pi
        self.bouncing = true
        --self:fadeOutAndRemove(0.5)
        arena:slideTo(320 + 80, arena.y, 1.5, "out-quad") --Slower slide to account for Ring

        self.charge_sound:stop()
        Assets.playSound("bomb")
        self.wave.loose = true

        --local angle = MathUtils.angle(self.x, self.random_y, Game.battle.soul.x, Game.battle.soul.y)

        local offset = 14
        local y = self.y + offset

        self.wave:spawnBullet("ZobateBolt", self.x, y, 12, 0)
        self.wave:spawnBullet("ZobateBolt", self.x, y, 12, math.rad(330))
        self.wave:spawnBullet("ZobateBolt", self.x, y, 12, math.rad(30))
        self.wave:spawnBullet("ZobateRing", self.x + offset, y, 12, 0) --make this randomly orange or blue

        self.delay = self.wave.delay
    end

    if not self.bouncing then
        self.physics.speed = self.physics.speed + (1 * DTMULT)
    else
        --self.physics.speed = self.physics.speed - (1 * DTMULT) --Cooked
    end

    self.random_y = self.initial_y + math.random(-30, 30)

    if self.delay then
        if self.side == "right" and self.x > SCREEN_WIDTH + self.delay then
            self.wave:spawnBullet("ZobateSpirit2", -50, self.random_y, "left")
            self:remove()
        elseif self.side == "left" and self.x < 0 - self.delay then
            self.wave:spawnBullet("ZobateSpirit2", 710, self.random_y, "right")
            self:remove()
        end
    end
end

return ZobateSpirit2