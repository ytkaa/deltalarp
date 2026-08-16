local Zobate, super = Class(EnemyBattler)

function Zobate:init()
    super.init(self)

    -- Enemy name
    self.name = "Zobate"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("zobate")

    -- Floating code stolen from Kristal discord
    self.sine = 0
    self.float_height = 4
    self.float_speed = 0.1

    self.default_float_speed = 0.1

    -- Enemy health
    self.max_health = 1000
    self.health = 1000
    -- Enemy attack (determines bullet damage)
    self.attack = 8
    -- Enemy defense (usually 0)
    self.defense = 8
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (maybe this should always be 0 cuz its kinda an odd feature and we wanna be Difficult)
    self.spare_points = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {
        "AT 8 DF 8\n* Gitau,[wait:5] gitau.",
    }

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Zobate zobates zobatingly!",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    --self.low_health_text = "* Kipkip's leaf is torn."

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "zobate/stars3",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
    }

    self:registerAct("Clap", "Praise \nthe show", nil, 28)
    self:registerActFor("vess", "Cheer", "Praise \nthe show", {"grace", "vess"}, 58)
    self:registerActFor("grace", "Jeer", "Insult \nthe show", nil, 18)


    self.disable_mercy = false
    function Zobate:setTired(tired)
        self.tired = false
    end

    function Zobate:onAct(battler, name)
        if name == "Clap" then
            self:addMercy(4)
            return {
                "* " .. battler.chara.name .. " clapped!",
                "* Zobate appreciated this!"
            }
        elseif name == "Cheer" then
            self:addMercy(8)
            return {
                "* Vess and Grace cheered!",
                "* Zobate is ever grateful..!"
            }
        elseif name == "Jeer" then
            Game.battle:startActCutscene("zobate", "jeer")
            return
        end
        
        -- If the act is none of the above, run the base onAct function
        -- (this handles the Check act)
        return super.onAct(self, battler, name)
    end
end

function Zobate:update()
    super.update(self)
    if Game.battle.state ~= "DEFENDINGBEGIN" and Game.battle.state ~= "DEFENDING" then
        self.sine = self.sine + self.float_speed * DTMULT
        self.sprite.y = math.sin(self.sine) * self.float_height
        self.overlay_sprite.y = math.sin(self.sine) * self.float_height
    end
end

function Zobate:float_override()
    self.sine = self.sine + self.float_speed * DTMULT
    self.sprite.y = math.sin(self.sine) * self.float_height
    self.overlay_sprite.y = math.sin(self.sine) * self.float_height
end

function Zobate:selectWave()
    local turn = Game.battle.turn_count -- The battle keeps track of the current turn automatically

    -- Select specific waves based on the turn
    if turn == 1 then
        self.selected_wave = "zobate/stars1"
        return self.selected_wave
    elseif turn == 2 then
        self.selected_wave = "zobate/mask1"
        return self.selected_wave
    elseif turn == 3 then
        self.selected_wave = "zobate/spirit1"
        return self.selected_wave
    elseif turn == 4 then
        self.selected_wave = "zobate/stars2"
        return self.selected_wave
    elseif turn == 5 then
        self.selected_wave = "zobate/mask2"
        return self.selected_wave
    elseif turn == 6 then
        self.selected_wave = "zobate/stars3"
        return self.selected_wave
    elseif turn == 7 then
        self.selected_wave = "zobate/mask3"
        return self.selected_wave
    end


    -- Use random wave selection when the script runs out (assuming self.waves is set)
    return super.selectWave(self)
end

return Zobate