local WorldBullet, super = HookSystem.hookScript(WorldBullet)

function WorldBullet:onDamage(soul)
    local damage = self:getDamage()
    local element = self.element or "none"
    local party = Game.party

    -- Matches element against each armor and applies damage reduction to the multiplier accordingly..!
    local getMultiplier = function(checked)
        local multiplier = 1
        for _,armor in pairs({checked:getArmor(1), checked:getArmor(2)}) do
            if armor then if armor.element then
                if armor.element == element then
                    if armor.element_defense == "major" then
                        multiplier = multiplier - 0.4
                    elseif armor.element_defense == "minor" then
                        multiplier = multiplier - 0.25
                    elseif armor.element_defense then
                        multiplier = multiplier - armor.element_defense
                    end
                end
            end end
        end

        return multiplier
    end

    if damage > 0 then
        local count = 1
        for _,member in ipairs(party) do
            --local chara = self.world:getPartyCharacter(member)
            local real_damage = damage

            local element_multiplier = getMultiplier(member)
            real_damage = math.floor(real_damage * element_multiplier)

            if real_damage ~= damage then
                print(member.name .. " reduced " .. string.upper(element) .. " element damage taken from " .. tostring(damage) .. " to " .. tostring(math.floor(real_damage)) .. "!")
            end

            self.world:hurtParty(count, real_damage)
            count = count + 1
        end
        

        local inv_frames = self:getInvulnFrames()

        -- TODO: Option to disable Invuln Bonus accuracy?
        -- Equipment invulnerability bonuses are only applied for single-target damage as of Chapter 5

        -- inv_frames = Game:applyInvulnBonuses(inv_frames)

        Game:setInvulnFrames(inv_frames)

        soul:onDamage(self, damage)
    end
end

return WorldBullet