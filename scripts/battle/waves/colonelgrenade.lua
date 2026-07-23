local colonelgrenade, super = Class(Wave)

function colonelgrenade:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 10
    local bullet
    local grenade_explosion
end

function colonelgrenade:onStart()
    -- Get all enemies that selected this wave as their attack
    local enemies = self:getAttackers()

    -- Loop through all attackers
    for _, colonel in ipairs(enemies) do
        --local kipkip = self:getAttackers()[1] --grab enemy pos
        --local x = SCREEN_WIDTH / 2 
        --local y = SCREEN_HEIGHT / 2 position is the middle of the screen

        self.timer:everyInstant(0.65, function()
            local start_x, start_y = colonel:getRelativePos(colonel.width/2, colonel.height/2) -- position is the enemy pos
            local target_x = Game.battle.soul.x --soul x
            local target_y = Game.battle.soul.y --soul y
            local bullet = self:spawnBullet("bullets/colonel/grenade", start_x, start_y)
            
            bullet.start_x = start_x
            bullet.start_y = start_y
            bullet.target_x = target_x
            bullet.target_y = target_y
            
            bullet.arc_timer = 0
            bullet.arc_duration = 45 -- Duration of the throw in frames (approx. 1.5 seconds)
            bullet.peak_height = 45  -- How high the arc curves upward

            bullet.update = function(b)
                b.arc_timer = b.arc_timer + DTMULT --DT is pretty much "per second". Affecting something by 50 * DT means changing something by 50 per second. DTMULT is instead "per frame".
                local progress = b.arc_timer / b.arc_duration --calculate a progress percentage based on how far along the grenade is on the parabola
                if progress > 1 then progress = 1 end

                b.x = b.start_x + (b.target_x - b.start_x) * progress --the grenade's x pos is moved along the parabola -- calculated progress multiplies the difference in start pos and target pos 

                local arc_y = b.peak_height * -4 * (progress - 0.5)^2 + b.peak_height --this is the parabola formula, y=ax^2+bx+c

                -- Apply standard linear Y drop plus the upward arc peak
                local linear_y = b.start_y + (b.target_y - b.start_y) * progress
                b.y = linear_y - arc_y

                if progress < 1 then
                    -- here its just doing the same calculations but for the next percentage of progress ahead, and then rotates the grenade accordingly
                    local next_progress = math.min(1, progress + 0.01)
                    local next_x = b.start_x + (b.target_x - b.start_x) * next_progress
                    local next_arc_y = b.peak_height * -4 * (next_progress - 0.5)^2 + b.peak_height
                    local next_linear_y = b.start_y + (b.target_y - b.start_y) * next_progress
                    local next_y = next_linear_y - next_arc_y

                    b.rotation = Utils.angle(b.x, b.y, next_x, next_y)
                end

                -- when it completes the parabola, explode
                if progress >= 1 then
                    b:remove()
                    local grenade_explosion = self:spawnBullet("grenade_explosion", b.x, b.y) --summons the explosion which is dealt with in its own bullet file
                    Assets.playSound("bomb")
                end
            end
        end)
    end
end

function colonelgrenade:update()
    super.update(self)
end

return colonelgrenade