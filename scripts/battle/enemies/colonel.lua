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
        "* Colonel refuses to retreat.",
        "* Colonel opens a heart-shaped locket and stares fondly.",
        "* Colonel tries to steady their aim.",
        "* Colonel signals something in morse code."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Colonel tries to bandage themself. \nThey don't have arms."

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "colonelgrenade",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "For God and country!",
        "To hell with Gardner!",
        "We shall not sleep\nThough poppies grow",
        "I'm doing this for my home.",
        "I'm doing this for the Tree."
    }
    self:registerAct("Lower Guard", "Put down \nweapon")
    self:registerAct("Knock Helmet", "Knock \nhelmet off")
    self.guardLowered = false

    function Colonel:onAct(battler, name)
        if name == "Lower Guard" then
            if self.guardLowered == false then
                self.guardLowered = true
                battler.chara:addStatBuff("attack", -99)
                self.dialogue_override = "...guess you're \nnot with Gardner?"
                return {
                    "* You dropped your weapon.\nAttack nullified!",
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
                self:addMercy(100)
                self.dialogue_override = "I SURRENDER!!!\nI SURRENDER!!!\nI'M UNARMED!!!"
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