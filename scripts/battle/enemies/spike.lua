local Spike, super = Class(EnemyBattler)

function Spike:init()
    super.init(self)

    -- Enemy name
    self.name = "Spike"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("spike")

    -- Enemy health
    self.max_health = 60
    self.health = 60
    -- Enemy attack (determines bullet damage)
    self.attack = 3
    -- Enemy defense (usually 0)
    self.defense = 1
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 3 DF 1\n* Its name is Spike."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Spike looks sharp.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    --self.low_health_text = "* Kipkip's leaf is torn."

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "spike",
        "spike2",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Stabby stab",
        "Stabbouli",
        "Stabs stab",
        "Stab stabby",
        "Stabbe stab",
        "Stabum stab",
        "Stab stabs",
        "Stab stab",
        "Stabby stabby",
    }
    self.challenge_active = false
    --self:registerAct("Sidestep", "Sidestep \nspikes")
    self:registerAct("Challenge", "Faster \nspikes")
    --if #Game.party == 2 and Game.party[2].id == "grace" then
    --    self:registerActFor("grace","Wave", "Wave at\nKipkip")
    --end

    function Spike:onAct(battler, name)
        if name == "Challenge" then
            Game:setFlag("spikeChallengeActive", true) --taking the lazy way out sorry
            return {
                "* " .. battler.chara.name .. " challenges Spike.[wait:5]\n* Attack speed increased!",
            }
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                self:addMercy(50)
                return "* "..battler.chara:getName().." polishes Spike."
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end

    function Spike:onTurnEnd()
        if Game:getFlag("spikeChallengeActive") then
            Game:setFlag("spikeChallengeActive", false)
            self:addMercy(100)
        end
    end
end

return Spike