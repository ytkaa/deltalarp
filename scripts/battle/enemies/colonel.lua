local Colonel, super = Class(EnemyBattler)

function Colonel:init()
    super.init(self)

    -- Enemy name
    self.name = "Colonel"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("colonel")

    -- Enemy health
    self.max_health = 50
    self.health = 50
    -- Enemy attack (determines bullet damage)
    self.attack = 2
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 25

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 2 DF 0\n* A common soldier. \nServing to protect the homeland."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Colonel opens a heart-shaped locket and stares fondly.",
        "* Colonel tries to steady their aim.",
        "* Colonel signals something in morse code."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Colonel tries to bandage themself. \nThey don't have arms."

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "colonelgrenade",
        "colonelrifle",
        "colonelstand",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "For Lord and country!",
        "To hell with Gardner!",
        "We shall not sleep\nThough poppies grow",
        "I'm doing this for my home.",
        "I'm doing this for Three."
    }
    self:registerAct("Lower Guard", "Put down \nweapon")
    self:registerAct("Knock Helmet", "Knock \nhelmet off")
    self.guardLowered = false
    self.disarmed = false

    function Colonel:getNextWaves()
        local match_count = 0
        if self.wave_override then
            if self.disarmed == false then
                local wave = self.wave_override
                self.wave_override = nil
                return {wave}
            end
        end

        local waves = TableUtils.copy(self.waves) -- Create a copy of the original waves table

        if Game.battle and Game.battle.enemies then --counts how many colonels there are to set up specific attack combos
            for _, enemy in ipairs(Game.battle.enemies) do
                if enemy.name == "Colonel" then
                    match_count = match_count + 1
                end
            end
            if match_count == 5 then
                if Game.battle.enemies[2].disarmed == false then
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return { "colonelrifle" }
                    end
                    Game.battle.enemies[2]:setAnimation("idlerifle")
                else
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[2]:setAnimation("idledisarmed")
                end
                if Game.battle.enemies[3].disarmed == false then
                    Game.battle.enemies[3].getNextWaves = function(self)
                        return { "colonelrifle" }
                    end
                    Game.battle.enemies[3]:setAnimation("idlerifle")
                else
                    Game.battle.enemies[3].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[3]:setAnimation("idledisarmed")
                end
                if Game.battle.enemies[4].disarmed == false then
                    Game.battle.enemies[4].getNextWaves = function(self)
                        return { "colonelrifle" }
                    end
                    Game.battle.enemies[4]:setAnimation("idlerifle")
                else
                    Game.battle.enemies[4].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[4]:setAnimation("idledisarmed")
                end
                if Game.battle.enemies[5].disarmed == false then
                    Assets.playSound("grenadeannounce") 
                    Game.battle.enemies[5].getNextWaves = function(self)
                        return { "colonelgrenade" }
                    end
                    Game.battle.enemies[5]:setAnimation("idlegrenade")
                else
                    Game.battle.enemies[5].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[5]:setAnimation("idledisarmed")
                end
            if Game.battle.enemies[1].disarmed == false then --this is for the FIRST enemy (topmost one) (don't ask me why it has to be like this)
                Game.battle.enemies[1]:setAnimation("idlebayonet")
                return { "colonelstand" }
            else
                Game.battle.enemies[1]:setAnimation("idledisarmed")
                return { }
            end
            elseif match_count == 4 then
                if Game.battle.enemies[2].disarmed == false then
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return { "colonelrifle" }
                    end
                    Game.battle.enemies[2]:setAnimation("idlerifle")
                else
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[2]:setAnimation("idledisarmed")
                end
                if Game.battle.enemies[3].disarmed == false then
                    Game.battle.enemies[3].getNextWaves = function(self)
                        return { "colonelrifle" }
                    end
                    Game.battle.enemies[3]:setAnimation("idlerifle")
                else
                    Game.battle.enemies[3].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[3]:setAnimation("idledisarmed")
                end
                if Game.battle.enemies[4].disarmed == false then
                    Assets.playSound("grenadeannounce") 
                    Game.battle.enemies[4].getNextWaves = function(self)
                        return { "colonelgrenade" }
                    end
                    Game.battle.enemies[4]:setAnimation("idlegrenade")
                else
                    Game.battle.enemies[4].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[4]:setAnimation("idledisarmed")
                end
            if Game.battle.enemies[1].disarmed == false then --this is for the FIRST enemy (topmost one) (don't ask me why it has to be like this)
                Game.battle.enemies[1]:setAnimation("idlebayonet")
                return { "colonelstand" }
            else
                Game.battle.enemies[1]:setAnimation("idledisarmed")
                return { }
            end
            elseif match_count == 3 then
                if Game.battle.enemies[2].disarmed == false then
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return { "colonelrifle" }
                    end
                    Game.battle.enemies[2]:setAnimation("idlerifle")
                else
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[2]:setAnimation("idledisarmed")
                end
                if Game.battle.enemies[3].disarmed == false then
                    Assets.playSound("grenadeannounce", 3) 
                    Game.battle.enemies[3].getNextWaves = function(self)
                        return { "colonelgrenade" }
                    end
                    Game.battle.enemies[3]:setAnimation("idlegrenade")
                else
                    Game.battle.enemies[3].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[3]:setAnimation("idledisarmed")
                end
            if Game.battle.enemies[1].disarmed == false then --this is for the FIRST enemy (topmost one) (don't ask me why it has to be like this)
                Game.battle.enemies[1]:setAnimation("idlebayonet")
                return { "colonelstand" }
            else
                Game.battle.enemies[1]:setAnimation("idledisarmed")
                return { }
            end
            elseif match_count == 2 then
                Assets.playSound("grenadeannounce") 
                if Game.battle.enemies[2].disarmed == false then
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return { "colonelgrenade" }
                    end
                    Game.battle.enemies[2]:setAnimation("idlegrenade")
                else
                    Game.battle.enemies[2].getNextWaves = function(self)
                        return {}
                    end
                    Game.battle.enemies[2]:setAnimation("idledisarmed")
                end
            if Game.battle.enemies[1].disarmed == false then --this is for the FIRST enemy (topmost one) (don't ask me why it has to be like this)
                Game.battle.enemies[1]:setAnimation("idlebayonet")
                return { "colonelstand" }
            else
                Game.battle.enemies[1]:setAnimation("idledisarmed")
                return { }
            end
            elseif match_count == 1 then
                local thisentiresequencewassodumbtoprogram = { "colonelgrenade", "colonelrifle" }
                local chosen_wave = Utils.pick(thisentiresequencewassodumbtoprogram)
                if Game.battle.enemies[1].disarmed == false then --this is for the FIRST enemy (topmost one) (don't ask me why it has to be like this)
                    if chosen_wave == "colonelgrenade" then
                        Assets.playSound("grenadeannounce") 
                        Game.battle.enemies[1]:setAnimation("idlegrenade")
                        return {"colonelgrenade"}
                    elseif chosen_wave == "colonelrifle" then
                        Game.battle.enemies[1]:setAnimation("idlerifle")
                        return {"colonelrifle"}
                    end
                else
                    Game.battle.enemies[1]:setAnimation("idledisarmed")
                    return { }
                end
            end
        end

        return waves -- return the new table 
    end

    function Colonel:onAct(battler, name)
        if name == "Lower Guard" then
            if self.guardLowered == false then
                local enemies = Game.battle.enemies
                for _, enemy in ipairs(enemies) do
                    if enemy.name == "Colonel" then
                        enemy.guardLowered = true
                        enemy:flash()
                        enemy.dialogue_override = "...guess you're \nnot with Gardner?"
                    end
                end
                battler.chara:addStatBuff("attack", -99)
                return {
                    "* You dropped your weapon.\nAttack nullified! The enemies \nlower their guard.",
                }
            elseif self.guardLowered == true then
                return {
                    "* Seems their guard is \nlowered enough.",
                }
            end
        elseif name == "Knock Helmet" then
            if self.guardLowered == false then
                Game.battle:hurt(10, true, user)
                self.dialogue_override = "You're not getting\nthe drop on me!"
                return {
                "* Colonel smacked you with their \ngear!",
                "* Seems like you need to \nlower their guard first...",
                } 
            elseif self.guardLowered == true then
                self.disarmed = true
                self:addMercy(100)
                Assets.playSound("bump")
                self.dialogue_override = "I SURRENDER!!!\nI SURRENDER!!!\nI'M UNARMED!!!"
                self:setAnimation("idledisarmed")
                return {
                    "* Colonel's helmet comes flying off!",
                    "* Colonel drops their gear in fear!" --sprite change
                }
            end
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                self:addMercy(50)
                return "* "..battler.chara:getName().." saluted."
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end
end

return Colonel