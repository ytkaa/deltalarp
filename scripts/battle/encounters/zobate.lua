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

    local enemy = self:addEnemy("zobate", 320, 90)

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

return Zobate