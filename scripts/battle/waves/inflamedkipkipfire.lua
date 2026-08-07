local inflamedkipkipfire, super = Class(Wave)

function inflamedkipkipfire:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 10
    local bullet
end

function inflamedkipkipfire:onStart()
    -- Get all enemies that selected this wave as their attack
    local inflamedkipkips = self:getAttackers()

    -- Loop through all attackers
    for _, inflamedkipkip in ipairs(inflamedkipkips) do
        --local kipkip = self:getAttackers()[1] --grab enemy pos
        --local x = SCREEN_WIDTH / 2 
        --local y = SCREEN_HEIGHT / 2 position is the middle of the screen

        self.timer:everyInstant(0.25, function()
            local start_x, start_y = inflamedkipkip:getRelativePos(inflamedkipkip.width/2, inflamedkipkip.height/2) -- position is the enemy pos
            local target_x = Game.battle.soul.x --soul x
            local target_y = Game.battle.soul.y --soul y
            local bullet = self:spawnBullet("inflamedkipkipflame", start_x, start_y)
            Assets.playSound("wing")
            
            bullet.start_x = start_x
            bullet.start_y = start_y
            bullet.target_x = target_x
            bullet.target_y = target_y
            
            bullet.arc_timer = 0
            bullet.arc_duration = 75
            bullet.peak_height = 100
            bullet.flameScale = 2
            local old_update = bullet.update

            bullet.update = function(b)
                old_update(b) --runs inflamedkipkipflame:update()
                b.arc_timer = b.arc_timer + DTMULT --DT is pretty much "per second". Affecting something by 50 * DT means changing something by 50 per second. DTMULT is instead "per frame".
                local progress = b.arc_timer / b.arc_duration --calculate a progress percentage based on how far along the grenade is on the parabola
                if progress > 1 then progress = 1 end

                b.x = b.start_x + (b.target_x - b.start_x) * progress

                local arc_y = b.peak_height * -4 * (progress - 0.5)^2 + b.peak_height --this is the parabola formula, y=ax^2+bx+c

                local linear_y = b.start_y + (b.target_y - b.start_y) * progress
                b.y = linear_y - arc_y

                if progress < 1 then
                    local next_progress = math.min(1, progress + 0.01)
                    local next_x = b.start_x + (b.target_x - b.start_x) * next_progress
                    local next_arc_y = b.peak_height * -4 * (next_progress - 0.5)^2 + b.peak_height
                    local next_linear_y = b.start_y + (b.target_y - b.start_y) * next_progress
                    local next_y = next_linear_y - next_arc_y
                    if b.flameScale > 0 then
                        b.flameScale = b.flameScale - 0.025
                    end
                    bullet:setScale(b.flameScale)
                end
                if progress >= 1 then
                    b:remove()
                end
            end
        end)
    end
end

function inflamedkipkipfire:update()

    super.update(self)
end

return inflamedkipkipfire