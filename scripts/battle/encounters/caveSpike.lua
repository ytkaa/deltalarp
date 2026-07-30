local caveSpike, super = Class(Encounter)

function caveSpike:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Spike and Kipkip ambush you!"

    -- Battle music ("battle" is rude buster)
    Game.music:stop()
    self.music = "soil_battle"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("spike")
    self:addEnemy("kipkip")
end

function caveSpike:onBattleEnd()
    Game.music:stop()
    Game.music:play("soil_theme")
end

return caveSpike