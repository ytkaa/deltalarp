local Bullet, super = HookSystem.hookScript(Bullet)

function Bullet:onDamage(soul)
    local damage = self:getDamage()

    if damage > 0 then
        local target = self:getTarget()
        local battlers = Game.battle:hurt(damage, false, target, self:shouldSwoon(damage, target, soul), self.element)

        local inv_frames = self:getInvulnFrames()

        -- TODO: Option to disable Invuln Bonus accuracy?
        -- Equipment invulnerability bonuses are only applied for single-target damage as of Chapter 5
        if target ~= "ALL" then
            inv_frames = Game:applyInvulnBonuses(inv_frames)
        end

        Game:setInvulnFrames(inv_frames)

        soul:onDamage(self, damage)

        return battlers
    end
    return {}
end

return Bullet