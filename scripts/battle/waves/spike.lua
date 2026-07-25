local MovingArena, super = Class(Wave)

function MovingArena:init()
    super.init(self)

    -- Initialize timer
    self.siner = 0
end

function MovingArena:onStart()
    -- Get the arena object
    local arena = Game.battle.arena

    -- Spawn spikes on top of arena
    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width / 2, 0, math.rad(0))

    -- Spawn spikes on bottom of arena (rotated 180 degrees)
    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width / 2, arena.height, math.rad(180))

    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y
end

function MovingArena:update()
    --local theta = self.siner --different movement.. might be cool to reuse later --- r=a^{2\ }\cos\left(2\theta\right) (put into desmos)
    --local a = 100
   -- local sin = math.sin(2 * theta)

    --local r = a * math.sqrt(math.abs(math.sin(2 * theta)))

    --local x = r * math.cos(theta)
   -- local y = r * math.sin(theta)

    --Game.battle.arena:setPosition(
    --    self.arena_start_x + x,
    --    self.arena_start_y + y
    --)

    local t = self.siner --somehow represents theta... i wanna research what this actually refers to later
    if self.challenge_active then
        local x = 140 * math.sin(t) -- moves the arena like a lemniscate --- r=\sqrt{a\sin\left(2\theta\right)} (put into desmos)
        local y = 60 * math.sin(2 * t)
        Game.battle.arena:setPosition(
            self.arena_start_x + x,
            self.arena_start_y + y
        )
    else
        local x = 200 * math.sin(t) -- moves the arena like a lemniscate --- r=\sqrt{a\sin\left(2\theta\right)} (put into desmos)
        local y = 60 * math.sin(2 * t)
        Game.battle.arena:setPosition(
            self.arena_start_x + x,
            self.arena_start_y + y
        )
    end

    self.siner = self.siner + DT
    super.update(self)
end

return MovingArena
