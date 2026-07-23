local colonelrifle, super = Class(Wave)

function colonelrifle:init()
    super.init(self)

    self.time = 10
    self.telegraph = true
    self.telegraph_enemies = {}
end

function colonelrifle:onStart()
    local enemies = self:getAttackers()

    self.telegraph_enemies = enemies -- do NOT expect to have fun when configuring telegraphs btw

    for _, colonel in ipairs(enemies) do
        self.timer:every(1.5, function()
            local x, y = colonel:getRelativePos(colonel.width/2, colonel.height/2) -- position is the enemy pos
            local target_angle = MathUtils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            self.telegraph = false
            local bullet = self:spawnBullet("colonelriflebullet", x, y) --has its own lua file for the after effect fade
            bullet.rotation = target_angle
            bullet.physics.match_rotation = true
            bullet.physics.speed = 10
            self.timer:after(0.5, function() --turn telegraph back on after a bit for the next bullet
                self.telegraph = true
            end)
        end)
    end
    self.timer:every(1.5, function()
        Assets.playSound("colonelrifle")
    end)
end

function colonelrifle:draw() --telegraphing, needs to be LOVE's "draw" function.
    if not self.telegraph then
        return
    end

    self.layer = BATTLE_LAYERS["above_arena"] -- "BATTLE_LAYERS[above_arena]" is where this line is drawn, and it takes up EVERYTHING on that layer. So do NOT make the entire thing something like Arena, Soul, or even worse, love

    love.graphics.setColor({ 1, 0, 0, 0.4 }) -- Draw in a translucent red colour
    love.graphics.setLineWidth(5) -- Draw a 16px width line
    love.graphics.setLineStyle("rough") -- Draw the line with rough edges

    for _, colonel in ipairs(self.telegraph_enemies) do
        local x, y = colonel:getRelativePos(colonel.width/2, colonel.height/2) -- position is the enemy pos
        love.graphics.line(x, y, Game.battle.soul.x, Game.battle.soul.y)
    end
end

function colonelrifle:update()
    super.update(self)
end

return colonelrifle