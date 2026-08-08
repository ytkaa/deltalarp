local Battle, super = HookSystem.hookScript(Battle)

function Battle:hurt(amount, exact, target, swoon, element)
    -- If target is a numberic value, it will hurt the party battler with that index
    -- "ANY" will choose the target randomly
    -- "ALL" will hurt the entire party all at once
    target = target or "ANY"

    -- Elements
    element = element or "none"

    -- Alright, first let's try to adjust targets.

    if type(target) == "number" then
        target = self.party[target]
    end

    if isClass(target) and target:includes(PartyBattler) then
        if (not target) or (target.chara:getHealth() <= 0) then -- Why doesn't this look at :canTarget()? Weird.
            target = self:randomTargetOld()
        end
    end

    if target == "ANY" then
        target = self:randomTargetOld()

        if isClass(target) and target:includes(PartyBattler) then
            -- Calculate the average HP of the party.
            -- This is "scr_party_hpaverage", which gets called multiple times in the original script.
            -- We'll only do it once here, just for the slight optimization. This won't affect accuracy.

            -- Speaking of accuracy, this function doesn't work at all!
            -- It contains a bug which causes it to always return 0, unless all party members are at full health.
            -- This is because of a random floor() call.
            -- I won't bother making the code accurate; all that matters is the output.

            local party_average_hp = 1

            for _, battler in ipairs(self.party) do
                if battler.chara:getHealth() ~= battler.chara:getStat("health") then
                    party_average_hp = 0
                    break
                end
            end

            -- Retarget... twice.
            if target.chara:getHealth() / target.chara:getStat("health") < (party_average_hp / 2) then
                target = self:randomTargetOld()
            end
            if target.chara:getHealth() / target.chara:getStat("health") < (party_average_hp / 2) then
                target = self:randomTargetOld()
            end

            -- If we landed on Kris (or, well, the first party member), and their health is low, retarget (plot armor lol)
            if (target == self.party[1]) and ((target.chara:getHealth() / target.chara:getStat("health")) < 0.35) then
                target = self:randomTargetOld()
            end

            -- They got hit, so un-darken them
            target.should_darken = false
            target.targeted = true
        end
    end
    
    -- Matches element against each armor and applies damage reduction to the multiplier accordingly..!
    local getMultiplier = function(checked)
        local multiplier = 1
        for _,armor in pairs({checked.chara:getArmor(1), checked.chara:getArmor(2)}) do
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

    -- Now it's time to actually damage them!
    if isClass(target) and target:includes(PartyBattler) then
        local real_amount = amount
        local element_multiplier = getMultiplier(target)

        real_amount = real_amount * element_multiplier

        if real_amount ~= amount then
            print(target.chara.name .. " reduced " .. string.upper(element) .. " element damage taken from " .. tostring(amount) .. " to " .. tostring(math.floor(real_amount)) .. "!")
        end

        target:hurt(real_amount, exact, nil, { swoon = self.encounter:canSwoon(target) and swoon })
        return { target }
    end

    if target == "ALL" then
        Assets.playSound("hurt")
        local alive_battlers = TableUtils.filter(self.party, function(battler) return not battler.is_down end)
        for _, battler in ipairs(alive_battlers) do
            local real_amount = amount
            local element_multiplier = getMultiplier(battler)

            real_amount = real_amount * element_multiplier

            if real_amount ~= amount then
                print(battler.chara.name .. " reduced " .. string.upper(element) .. " element damage taken from " .. tostring(amount) .. " to " .. tostring(math.floor(real_amount)) .. "!")
            end

            battler:hurt(real_amount, exact, nil, { all = true, swoon = self.encounter:canSwoon(battler) and swoon })
        end
        -- Return the battlers who aren't down, aka the ones we hit.
        return alive_battlers
    end
end

return Battle