local ZobateMask, super = Class(Bullet)

function ZobateMask:init(x, y, divisor)
    super.init(self, x, y, "bullets/zobate/mask" .. Utils.pick({"", "_brow", "_evil", "_evil_fangs", "_mad", "_oh", "_sad", "_distraught"}))
    
    self.divisor = divisor or 5

    self.element = "entertainment"

    self.follow = true
    self.should_damage = true

    self.destroy_on_hit = false

    self:setScale(0.5)
    self.sprite.alpha = 0

    self.sprite:fadeTo(1, 0.5)

    self.physics.speed = 1

    self.damage = 30 -- -10 from standard damage due to dodging difficulty

    Game.battle.timer:tween(0.5, self, {scale_x = 2, scale_y = 2}, "out-sine")
    Game.battle.timer:after(1, function()
        self.follow = false
        self:fadeOutAndRemove(1.5)
        self.can_graze = false

        Game.battle.timer:tween(1.5, self.physics, {speed = 0}, "out-sine")
    end)
    Game.battle.timer:after(1.5, function() self.should_damage = false end)

    
end

function ZobateMask:update()
    super.update(self)
    if self.follow and Game.battle.soul then
        self.physics.direction = MathUtils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
        self.physics.speed = self.physics.speed + (1/self.divisor * DTMULT)
    end
end

function ZobateMask:onDamage(soul)
    if self.should_damage then
        super.onDamage(self, soul)
    else
        --Yeah.
    end
end

return ZobateMask