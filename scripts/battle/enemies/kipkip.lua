local Kipkip, super = Class(EnemyBattler)

function Kipkip:init()
    super.init(self)

    -- Enemy name
    self.name = "Kipkip"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("kipkip")

    -- Enemy health
    self.max_health = 120
    self.health = 120
    -- Enemy attack (determines bullet damage)
    self.attack = 3
    -- Enemy defense (usually 0)
    self.defense = 1
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 3 DF 1\n* Friendly little guy. \nHe just wants to bloom."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Kipkip analyzes your ability to plan and lead.",
        "* Kipkip looks for nectar to make itself stronger.",
        "* Kipkip thinks you'd look authoritative with a whistle."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Kipkip's leaf is torn." --sprite change?

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "kipkipthrow",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = { -- these will be voiced by me (pikmin) in a similar manner to how pikmin sound
        "Waaahhh!",
        "Hup hup hup!",
        "Hunnng...",
        "Mi yen hop!",
        "Quado!"
    }
    self:registerAct("Spray Water", "Spray with \nwater")
    self:registerAct("Give Nectar", "Makes \nstronger")    
    if #Game.party == 2 and Game.party[2].id == "grace" then
        self:registerActFor("grace","Wave", "Wave at\nKipkip")
    end
    self.kipkipBloomed = false

    function Kipkip:onAct(battler, name)
        if name == "Give Nectar" then
            if self.kipkipBloomed == false then
                self.kipkipBloomed = true
                Assets.playSound("nectarslurp") 
                -- Give the enemy 100% mercy
                self:addMercy(100)
                -- Change this enemy's dialogue for 1 turn
                self.dialogue_override = "Awwhf!!!"
                self.attack = self.attack + 3 -- increase attack damage because in the pikmin games flower pikmin are stronger than leaf pikmin
                -- Act text (since it's a list, multiple textboxes)
                return {
                    "* Kipkip is overjoyed.[wait:5]\n* He has finally bloomed.",
                    "* Kipkip also became stronger! \nAttack increased!"
                }
            elseif self.kipkipBloomed == true then
                return {
                    "* Kipkip rejected. It's a work day tomorrow.",
                }
            end
        elseif name == "Spray Water" then
            self.kipkipAgitated = true
            return {
                "* You spritzed\nKipkip with water.", --sprite change
                "* The enemies became agitated!\nAttack speed increased!"
            }
        elseif name == "Wave" then
            self.sprite:setAnimation({"wave", 0.05, true})
            -- G-Action text
            return {
            "* Grace waves.\nKipkip waves back.", --sprite change
            "* ...you don't feel like this\ncontributed to anything in particular."
            }   
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                return "* "..battler.chara:getName().." didn't do anything because\nI wasn't sure what to program here."
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end
end

return Kipkip