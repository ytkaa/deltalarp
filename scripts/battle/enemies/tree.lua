local Tree, super = Class(EnemyBattler)

function Tree:init()
    super.init(self)

    -- Enemy name
    self.name = "Tree"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("tree")

    -- Enemy health
    self.max_health = 200
    self.health = 200
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 3
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0
    self.toferDoT = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 5 DF 3\n* Its just a tree."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Smells like chlorophyll.",
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
    self:registerAct("Talk", "Talk \ntherapy")

    function Tree:onAct(battler, name)
        if name == "Talk" then
            self:addMercy(10)
            return {
                "* " .. battler.chara.name .. " ertherth!",
            }
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                self:addMercy(5)
                return "* "..battler.chara:getName().." chats it up."
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end

    function Tree:onTurnEnd()
        super.onTurnEnd(self)
        
        if self.active then
            if self.toferDoT > 0 then
                self.toferDoT = self.toferDoT - 1
                self:hurt(math.ceil(MathUtils.random(10, 13)))
            end
        end
    end
end

return Tree