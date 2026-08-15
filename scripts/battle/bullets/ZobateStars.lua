local ZobateStars, super = Class(Bullet)

function ZobateStars:init(x, y, side)
    super.init(self, x, y, nil)
    
    self.element = "entertainment"

    self.side = side

    Assets.playSound("wing")

    local wave = Game.battle.waves[1]

    local star1 = wave:spawnBullet("ZobateStar", x, y, 0, 0)
    local star2 = wave:spawnBullet("ZobateStar", x, y, 0, 0)
    local star3 = wave:spawnBullet("ZobateStar", x, y, 0, 0)

    local setupStar = function(star)
        star.physics.match_rotation = false
        star.sprite:setRotationOrigin(0.5)
    end

    setupStar(star1)
    setupStar(star2)
    setupStar(star3)

    --Positioning
    if side == 0 then
        star1:slideTo(400, 100, 1, "out-sine")
        star2:slideTo(430, 160, 1, "out-sine")
        star3:slideTo(460, 220, 1, "out-sine")
    else
        star1:slideTo(460 - Game.battle.arena.width * 1.55, 100, 1, "out-sine")
        star2:slideTo(430 - Game.battle.arena.width * 1.55, 160, 1, "out-sine")
        star3:slideTo(400 - Game.battle.arena.width * 1.55, 220, 1, "out-sine")
    end

    local stars = {star1, star2, star3}

    Game.battle.timer:after(1, function() if Game.battle.soul then Assets.playSound("stardrop") end end)

    for _,star in ipairs(stars) do
        Game.battle.timer:tween(1, star.sprite, {rotation = math.random() * (2 * math.pi)}, "out-sine", function()
            if Game.battle.soul then
                local angle = MathUtils.angle(star.x, star.y, Game.battle.soul.x, Game.battle.soul.y)
                star.physics.direction = angle
                star.physics.speed = 18
                star.spinning = true
                star:fadeOutAndRemove(1)
            end
        end)
    end
end

function ZobateStars:update()
    super.update(self)

end

return ZobateStars