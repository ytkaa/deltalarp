local Flowerylonglegs, super = Class(EnemyBattler)

function Flowerylonglegs:init()
    super.init(self)

    -- Enemy name
    self.name = "Flowery Long Legs"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("flowerylonglegs")

    -- Enemy health
    self.max_health = 300
    self.health = 300
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 7
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {
        "AT 5 DF 7\n* Poisonous.",
        "Consumption results in prolonged writhing and uncontrollable mirth."
    }
    self.toferDoT = 0

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The Flowery Long Legs stomps wildly.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    --self.low_health_text = "* Kipkip's leaf is torn."

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "flowerylonglegsstompcrazy", --this is for the beginning attack, this gets changed later on
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
    }
    self.climbedHigh = false
    self:registerAct("Climb", "Closer to\nweakness")
    self:registerAct("Synthesize", "Healing\nflowers", {"tofer"}, 100)
    self.disable_mercy = true
    function Flowerylonglegs:setTired(tired)
        self.tired = false 
    end

    function Flowerylonglegs:onAct(battler, name)
        if name == "Climb" then
            if self.climbedHigh == false then
                self.climbedHigh = true
                self.defense = 2
                self.climbedHighTimer = 3
                return {
                    "* " .. battler.chara.name .. " climbed up its leg to get closer to its round body.",
                    "* Enemy defence dropped to 0 for two turns!"
                }
                --after two turns this goes away as it shakes you off
            elseif self.climbedHigh == true then
                return {
                    "* Already high enough.",
                }
            end
        elseif name == "Synthesize" then --X-Action
                self.getNextWaves = function(self)
                        return { "flowerylonglegsshootgreen" }
                    end
                return {
                    "* Your SOUL shined its power on Tofer!",
                    "* Tofer synthesized with the Flowery Long Legs.",
                    "* Green bullets now appear for this turn."
                }
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                self.attack = 4
                self.distractedCounter = 3
                return {
                    "* "..battler.chara:getName().." threw a carrot to distract it.",
                    "* Enemy attack decreased to 4 for this turn!"
                }
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end
    function Flowerylonglegs:onTurnEnd()
        self.getNextWaves = function(self)
            return { "flowerylonglegsstomp", "flowerylonglegsshoot" }
        end
        if self.climbedHighTimer then
            self.climbedHighTimer = self.climbedHighTimer - 1

            if self.climbedHighTimer <= 0 then
                self.defense = 7
                self.climbedHighTimer = nil
                self.climbedHigh = false
                Game.battle:battleText("* The Flowery Long Legs shook you off!\nEnemy defence raised back up!") --doesmt work for some reason
            end
        end
        if self.distractedCounter then
            self.distractedCounter = self.distractedCounter - 1

            if self.distractedCounter <= 0 then
                self.attack = 5
                self.distractedCounter = nil
                Game.battle:battleText("* Tofer's distraction wore off...") --doesmt work for some reason
            end
        end        
        if self.active then
            if self.toferDoT > 0 then
                self.toferDoT = self.toferDoT - 1
                self:hurt(math.ceil(MathUtils.random(10, 13)))
            end
        end
    end
end

return Flowerylonglegs