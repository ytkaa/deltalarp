local Player, super = HookSystem.hookScript(Player)

function Player:init(chara, x, y)
    super.init(self, chara, x, y)

    self.racing_state = PlayerRacingState(self)
    self.state_manager:addState("RACING", self.racing_state)
end

function Player:getCurrentSpeed(running)
    local speed = self:getBaseWalkSpeed()
    if running then
        if Game:getFlag("isCarryingTreasure") == true then
            speed = speed
        else
            if self.run_timer > 60 then
                speed = speed + (Game:isLight() and 6 or 5)
            elseif self.run_timer > 10 then
                speed = speed + 4
            else
                speed = speed + 2
            end
        end
    end
    return speed
end

function Player:isRacing()
    return self.state_manager.state == "RACING"
end

return Player