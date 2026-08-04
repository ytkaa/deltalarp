---@class BloomobeBurst : Event
---@field group     integer     *[property `group`]* Which trigger activates this
local BloomobeBurst, super = Class(Event)

function BloomobeBurst:init(x, y)
    super.init(self, x, y, 60, 60)
    self:setSprite("world/events/bloomobe/idle")
    self.solid = false
    self:setOrigin(0.50, 0.5)

    self.sprite.alpha = 0
    self.sprite:fadeToSpeed(1, 0.1, function() 
        self:setSprite("world/events/bloomobe/shoot")
        self.sprite:play(1/3, false, function() self.sprite:fadeOutSpeedAndRemove(0.15) self:fadeOutSpeedAndRemove(0.1) end)

        Assets.playSound("bloomer", 1, 1/math.random(5, 8))

        local dir = 0
        local angle = MathUtils.angle(self.x, self.y, self.world.soul.x, self.world.soul.y)

        for i = 1, 6 do
            self.world:spawnBullet("bloombulletclimb", self.x, self.y, dir, 12, Game:getDefaultInvulnFrames(), 8)
            dir = dir + math.rad(60)
        end

        self.world:spawnBullet("bloombulletclimb", self.x, self.y, angle, 12, Game:getDefaultInvulnFrames(), 8)
    end)
end

return BloomobeBurst