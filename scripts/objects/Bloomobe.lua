---@class Bloomobe : Event
---@field group     integer     *[property `group`]* Which trigger activates this
local Bloomobe, super = Class(Event)

function Bloomobe:init(x, y, properties)
    super.init(self, x, y, 60, 60)
    self:setSprite("world/events/bloomobe/idle", 1/math.random(2, 6))
    self.solid = false
    self:setOrigin(0.50, 0.5)
    --self.group = properties["group"] or 1

    self.cooldowned = false
    self.cooldown = properties["cooldown"] or 3
    self.range = properties["range"] or 250
end

function Bloomobe:update()
    local chara = self.world.player
    super.update(self)
    
    if MathUtils.dist(self.x, self.y, chara.x, chara.y) < self.range and self.world.in_battle_area and not self.cooldowned then
        self.cooldowned = true
        self.world.timer:after(self.cooldown, function() self.cooldowned = false end)

        self:setSprite("world/events/bloomobe/shoot")
        self.sprite:play(1/3, false, function() self:setSprite("world/events/bloomobe/idle", 1/math.random(2, 6))end)

        Assets.playSound("bloomer", 1, 1/math.random(5, 8))

        local dir = 0
        local angle = MathUtils.angle(self.x, self.y, chara.x, chara.y)

        for i = 1, 6 do
            self.world:spawnBullet("bloombullet", self.x, self.y, dir, 12)
            dir = dir + math.rad(60)
        end

        self.world:spawnBullet("bloombullet", self.x, self.y, angle, 12)

    end
end

return Bloomobe