local Fleecebug, super = Class(EnemyBattler)

function Fleecebug:init()
    super.init(self)

    -- Enemy name
    self.name = "Fleecebug"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("fleecebug")

    -- Enemy health
    self.max_health = 165
    self.health = 165
    -- Enemy attack (determines bullet damage)
    self.attack = 3
    -- Enemy defense (usually 0)
    self.defense = 10
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 3 DF 10\n* Its fluffy wool coat protects it from attacks."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Fleecebug tries to sniff you.",
    }
    if self.gotRobbed == true then
        self.text = {
            "* Fleecebug attempts to file a police report.",
        }
    else
        self.text = {
            "* Fleecebug tries to sniff you.",
        }
    end
    -- Text displayed at the bottom of the screen when the enemy has low health
    --self.low_health_text = "* Kipkip's leaf is torn."

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "fleecebugdrag",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
    }
    --self:registerAct("Sidestep", "Sidestep \nspikes")
    self:registerAct("Shave", "Reduce \ndefence")
    self:registerAct("Comb", "Comb \ncoat")
    self.fleeceShaved = false
    self.gotRobbed = false
    local confirm_count = 0
    if Game:getFlag("treasureHuntBegan") then
        self:registerActFor("vess","Rob", "Rob\nenemies")
    end

    function Fleecebug:onAct(battler, name)
        if name == "Shave" then
            if self.fleeceShaved == false then --sprite change
                self.fleeceShaved = true
                --Assets.playSound("nectarslurp")
                self.defense = self.defense - 9
                return {
                    "* Fleecebug was completely shaven.[wait:5]\n* It's heartbroken. Defence decreased!"
                }
            elseif self.fleeceShaved == true then
                return {
                    "* There's nothing more to shave...",
                }
            end
        elseif name == "Comb" then
            if self.fleeceShaved == false then --sprite change
                return {
                    "* You combed Fleecebug well.[wait:5]\n* It feels appreciated.",
                    self:addMercy(50)
                }
            elseif self.fleeceShaved == true then
                return {
                    "* The damage is irreparable.[wait:5]\n* Nothing can fix what you did.",
                }
            end
        elseif name == "Rob" then
            if self.gotRobbed == false then
                self.gotRobbed = true
                function Mod:onKeyPressed(key)
                    if Input.is("confirm", key) then
                        Assets.playSound("drive", 1, 1 + confirm_count)

                        for _, enemy in ipairs(Game.battle.enemies) do
                            if enemy.name == "Fleecebug" then
                                enemy:shake()
                                enemy:addMercy(10)
                            end
                        end
                        confirm_count = confirm_count + 0.1
                        if confirm_count >= 1 then
                            confirm_count = 0

                            Mod.onKeyPressed = nil
                            Game.battle:setActText("* Nice jobv")
                        end
                    end
                end
                Game.battle:infoText("* Spam [Z] to ROB!!!!", true) --infoText cannot be skipped by the player, setActText can
                if confirm_count == 1.1 then
                    return "" --returning text is needed otherwise it softlocks
                end
            else
                return {
                    "* Fleecebug has nothing left to its name.",
                }
            end
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                self:addMercy(25)
                return "* "..battler.chara:getName().." pet Fleecebug."
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end
end

return Fleecebug