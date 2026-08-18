local ZobateKame, super = Class(Bullet)

function ZobateKame:init(x, y)
    super.init(self, x, y, "bullets/zobate/kame")
    
    Assets.playSound("bigcut")

    self.element = "entertainment"

    self.destroy_on_hit = false

    self.sprite:play(1/3, true)

    self.should_damage = true

    self.multiplier = 2.05

    self.damage = 75

    self.tp = 6 --High risk high reward

    Game.battle.timer:after(0.01, function()
        local initial_y = Game.battle.arena.y

        local help_x,help_y = self:getRelativePosFor(Game.battle.arena)

        local left_list = {30, 75, 120}
        local right_list = {30, 75, 120}

        --Anti-cheese lists:
        local left_list_2 = {15, 75, 130}
        local right_list_2 = {15, 75, 130}

        Game.battle.timer:after(0.50, function()
            local left_random = math.random()
            local right_random = math.random()
            Game.battle.timer:every(0.1, function()
                if Game.battle.state == "DEFENDING" then
                    if left_random > 0.5 then
                        local flame = self.wave:spawnBullet("ZobateKameFlame", help_x, Utils.pick(left_list, nil, true), 0)
                    else
                        local flame = self.wave:spawnBullet("ZobateKameFlame", help_x, Utils.pick(left_list_2, nil, true), 0)
                    end
                end
            end, 3)
            Game.battle.timer:every(0.1, function()
                if Game.battle.state == "DEFENDING" then
                    if right_random > 0.5 then
                        local flame = self.wave:spawnBullet("ZobateKameFlame", help_x, Utils.pick(right_list, nil, true), math.pi)
                        flame.flip_x = true
                    else
                        local flame = self.wave:spawnBullet("ZobateKameFlame", help_x, Utils.pick(right_list_2, nil, true), math.pi)
                        flame.flip_x = true
                    end
                end
            end, 3)
        end)

        Game.battle.arena:slideTo(Game.battle.arena.x, Game.battle.arena.y + 125, 0.9, "out-cubic", function()
            Game.battle.arena:slideTo(Game.battle.arena.x, initial_y, 0.9, "in-cubic")
            self:fadeOutAndRemove(1)
            self.stretch = false
            self.wave:repetition()
            self.should_damage = false
            self.can_graze = false
        end)
        self.stretch = true
    end)
end

function ZobateKame:update()
    super.update(self)

    if self.stretch then
        self:setScale(2, self.scale_y + 0.1 * DTMULT * self.multiplier)
        self.multiplier = math.max(0.1, self.multiplier - 0.17 * DTMULT)
    end
end

function ZobateKame:onDamage(soul)
    if self.should_damage then
        super.onDamage(self, soul)
    else
        --Yeah.
    end
end

function ZobateKame:getTarget()
    return self.attacker and "ALL"
end


return ZobateKame