local inflamedKipkip, super = Class(EnemyBattler)

function inflamedKipkip:init()
    super.init(self)

    -- Enemy name
    self.name = "Inflamed Kipkip"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("inflamedkipkip")

    -- Enemy health
    self.max_health = 200
    self.health = 200
    -- Enemy attack (determines bullet damage)
    self.attack = 6
    -- Enemy defense (usually 0)
    self.defense = 7
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {
        "* AT 6 DF 7\n* A Kipkip that has abandonded material desire.",
        "Went on a spiritual journey to become an elemental shaman."
    }

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Inflamed Kipkip taps into their roots.",
        "* Inflamed Kipkip is no longer dependant on others.",
        "* Inflamed Kipkip prepares its next plan of action."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Inflamed Kipkip is fumbling its rotation."

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "inflamedkipkipfire",
        --"inflamedkipkiplightning",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = { -- these will be voiced by me (pikmin) in a similar manner to how pikmin sound
        "Yeho!",
        "Hup hup hup!",
        "Hunnng...",
        "Mi yen hop!",
    }
    self:registerAct("Spray Water", "Spray with \nwater")
    self:registerAct("Give Nectar", "Makes \nstronger")
    self:registerAct("Negotiate", "Negotiate \nsurrender")
    self.kipkipBloomed = false
    self.kipkipAgitated = false

    function inflamedKipkip:onAct(battler, name)
        if name == "Give Nectar" then
            if self.kipkipBloomed == false then
                self.kipkipBloomed = true
                Assets.playSound("boost") 
                self.dialogue_override = "Awwhf!!!"
                self.attack = self.attack + 2
                self:setAnimation("boosted")
                return {
                    "* Inflamed Kipkip has tapped into\n* the power of [color:pink]ULTRA-SPICY.",
                    "* Kipkip became stronger!\nAttack increased!",
                    "* ...Not sure why you thought this was a good idea."
                }
            elseif self.kipkipBloomed == true then
                return {
                    "* Inflamed Kipkip is as strong as can be.",
                }
            end
        elseif name == "Spray Water" then
            self.kipkipAgitated = true
            self.kipkipBloomed = false
            self:setTired(true)
            self.attack = 4
            self:setAnimation("burned")
            return {
                "* " .. battler.chara.name .. " spritzed Inflamed Kipkip\nwith water.",
                "* It's flame went out...[wait:5] Attack decreased![wait:5]\nInflamed Kipkip became [color:blue]TIRED[color:reset]!"
            }
        elseif name == "Negotiate" then
            if self.kipkipAgitated == false then
                return {
                    "* " .. battler.chara.name .. " tried to negotiate for\nInflamed Kipkip to surrender.",
                    "* But Inflamed Kipkip still\nthinks it has the advantage."
                }
            elseif self.kipkipAgitated == true then
                self:addMercy(100)
                return {
                    "* " .. battler.chara.name .. " tried to negotiate for \nInflamed Kipkip to surrender.",
                    "* Inflamed Kipkip views this \nas the best strategic outcome."
                }
            end
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                self:addMercy(25)
                return "* "..battler.chara:getName().." meditated."
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end
end

return inflamedKipkip