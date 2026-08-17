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
    self.attack = 4
    -- Enemy defense (usually 0)
    self.defense = 1
    -- Enemy reward
    self.money = 100
    self.toferDoT = 0

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 4 DF 1\n[wait:5]* Somewhat greedy little guy.[wait:5] \nHe desperately wants to bloom."

    -- Text randomly displayed at the bottom of the screen each turn
    if self.gotRobbed == true then
        self.text = {
            "* Kipkip can't believe you somehow managed to rob it.",
        }
    else
        self.text = {
            "* Kipkip analyzes your ability to \nplan and lead.",
            "* Kipkip looks for nectar to make itself stronger.",
            "* Kipkip thinks you'd look authoritative with a whistle."
        }
    end
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Kipkip's leaf is torn." --sprite change?

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "kipkipthrow",
        "kipkipchase"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = { -- these will be voiced by me (pikmin) in a similar manner to how pikmin sound
        "Yeho!",
        "Hup hup hup!",
        "Hunnng...",
        "Mi yen hop!",
        "Quado!"
    }
    self:registerAct("Spray Water", "Spray with \nwater")
    self:registerAct("Give Nectar", "Makes \nstronger")    
    self.nectarCount = 0
    self.gotRobbed = false
    local confirm_count = 0
    if Game:getFlag("treasureHuntBegan") then
        self:registerActFor("vess","Rob", "Rob\nenemies")
    end

    function Kipkip:onAct(battler, name)
        if name == "Give Nectar" then
            self.nectarCount = self.nectarCount + 1
            if self.nectarCount == 1 then
                Assets.playSound("nectarslurp") 
                self:addMercy(50)
                -- Change this enemy's dialogue for 1 turn
                self.dialogue_override = "Awwhf!!!"
                self.attack = self.attack + 1 -- increase attack damage because in the pikmin games flower pikmin are stronger than leaf pikmin
                -- Act text (since it's a list, multiple textboxes)
                return {
                    "* Kipkip enjoyed the snack![wait:5]\n* But he needs a little more...",
                    "* Kipkip also became stronger![wait:5] \nAttack increased!"
                }
            elseif self.nectarCount == 2 then --sprite change
                Assets.playSound("nectarslurp") 
                self:addMercy(50)
                -- Change this enemy's dialogue for 1 turn
                self.dialogue_override = "Awwhf!!!"
                self.attack = self.attack + 1 -- increase attack damage because in the pikmin games flower pikmin are stronger than leaf pikmin
                -- Act text (since it's a list, multiple textboxes)
                return {
                    "* Kipkip is overjoyed.[wait:5]\n* He has finally bloomed.",
                    "* Kipkip also became stronger![wait:5] \nAttack increased!"
                }
            elseif self.nectarCount >= 3 then
                return {
                    "* Kipkip rejected.[wait:5] It's a work day tomorrow.",
                }
            end
        elseif name == "Rob" then
            if self.gotRobbed == false then
                self.gotRobbed = true
                function Mod:onKeyPressed(key)
                    if Input.is("confirm", key) then
                        Assets.playSound("drive", 1, 1 + confirm_count)

                        for _, enemy in ipairs(Game.battle.enemies) do
                            if enemy.name == "Kipkip" then
                                enemy:shake()
                                enemy:addMercy(10)
                            end
                        end
                        confirm_count = confirm_count + 0.1
                        if confirm_count >= 1 then
                            confirm_count = 0

                            Mod.onKeyPressed = nil
                            Game.battle:setActText("* Stole D$250![wait:5] Nice jobv")
                            local debtPaid = Game:getFlag("debtPaid", 0)
                            Game:setFlag("debtPaid", debtPaid + 250)
                        end
                    end
                end
                Game.battle:infoText("* Spam [Z] to ROB!!!!", true) --infoText cannot be skipped by the player, setActText can
                if confirm_count == 1.1 then
                    return "" --returning text is needed otherwise it softlocks
                end
            else
                return {
                    "* Kipkip left everything else at home,[wait:5] thankfully.",
                }
            end
        elseif name == "Spray Water" then
            self.kipkipAgitated = true
            return {
                "* " .. battler.chara.name .. " spritzed Kipkip with water.", --sprite change
                "* The enemies became agitated!\n[wait:5]Attack speed increased!"
            }
        elseif name == "Standard" then --X-Action
                -- Text for any other character (like Noelle)
                self:addMercy(50)
                return {
                "* "..battler.chara:getName().." waves.[wait:5]\nKipkip waves back.",
                "* ...some sort of bonding\noccured from this."
                }
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end
    function Kipkip:onTurnEnd()
        super.onTurnEnd(self)
        
        if self.active then
            if self.toferDoT > 0 then
                self.toferDoT = self.toferDoT - 1
                self:hurt(math.ceil(MathUtils.random(10, 13)))
            end
        end
    end
end

return Kipkip