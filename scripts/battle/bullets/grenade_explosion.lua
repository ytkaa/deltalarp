local GrenadeExplosion, super = Class(Bullet)

function GrenadeExplosion:init(x, y)
    super.init(self, x, y, "bullets/colonel/explosion")
    self:setScale(0.85)
    self.element = "plant"
    self.damage = 20
end

function GrenadeExplosion:update()
    local current_scale = self.scale_x --every frame the explosion gets bigger but also fades out
    local current_alpha = self.alpha
    local new_alpha = current_alpha - (0.025 * DTMULT)
    local new_scale = current_scale + (0.1 * DTMULT)
    self:setScale(new_scale)
    self.alpha = new_alpha  
    if new_scale >= 15 then
        self:remove()
    end
    
    super.update(self)
end

function GrenadeExplosion:onDamage(soul)
    if self.alpha >= 0.3 then -- if the explosion hasn't faded out much
        for _, party in ipairs(Game.battle.party) do
            party:hurt(50) -- then do Big damage to all party members

            --Swiped from Bullet code
            local inv_frames = self:getInvulnFrames()

            -- Equipment invulnerability bonuses are only applied for single-target damage as of Chapter 5
            if target ~= "ALL" then
                inv_frames = Game:applyInvulnBonuses(inv_frames)
            end

            Game:setInvulnFrames(inv_frames)
        end
    end
    if self.alpha <= 0.3 then -- if the explosion faded out enough
        return {} -- nothing happens (ever.)
    end
end

return GrenadeExplosion