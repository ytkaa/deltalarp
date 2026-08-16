local Zobate, super = Class(Encounter)

function Zobate:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Zah ha ha and whatnot"

    -- Battle music ("battle" is rude buster)
    --Game.music:stop()
    self.music = "last_show_wip_2"
    -- Enables the purple grid battle background
    self.background = false

    self.zobate = self:addEnemy("zobate", 320, 90)

    self.zobate:setSprite("aura_goku")

    for _,battler in ipairs(Game.battle.party) do
        if battler.chara.id == "vess" then
            print("Yeah")
            local chair = Sprite("tilesets/farm_world/seat", 0, 20)
            chair:setScale(1)
            chair:setOrigin(0.5)
            chair:setLayer(BATTLE_LAYERS["below_battlers"])
            battler.chair = chair
            battler:addChild(chair)
        elseif battler.chara.id == "grace" then
            print("Yeah")
            local chair = Sprite("tilesets/farm_world/seat", -20, 20)
            chair.flip_x = true
            chair:setScale(1)
            chair:setOrigin(0.5)
            chair:setLayer(BATTLE_LAYERS["below_battlers"])
            battler.chair = chair
            battler:addChild(chair)
        end
    end
end

function Zobate:getPartyPosition(index) --it has to be like this for some reason
    if index == 1 then
        return 150, 280  -- Position for the first party member
    elseif index == 2 then
        return 490, 280  -- Position for the second party member
    else
        return Zobate:getPartyPosition(self, index) -- Default positions for others
    end
end

function Zobate:onStateChange(old, new, reason)
    super.onStateChange(old, new, reason)

    if new == "DEFENDINGBEGIN" then
        self.zobate.sprite:slideTo(0, 0, 0.2, "out-quad")
        self.zobate.overlay_sprite:slideTo(0, 0, 0.2, "out-quad")
        self.zobate.sine = 0
    end
end

function Zobate:onBattleInit()
    super.onBattleInit(self)

    local bg = Sprite("bosses/zobate/back", 0, 0)
    bg.wrap_texture_x = true
    bg.wrap_texture_y = true
    bg.physics.speed_x = -7
    bg.physics.speed_y = -7
    bg.alpha = 0
    --bg:play(1/2, true)

    Game.world:addChild(bg)
    bg.layer = 0.29 --Below stage

    self.bg = bg
end

function Zobate:onTurnStart()
    super.onTurnStart(self)

    local turn = Game.battle.turn_count

    if self.bg.alpha < 1 and turn > 5 then
        self.bg.alpha = math.min(self.bg.alpha + 0.02, 1)
    end
end

return Zobate