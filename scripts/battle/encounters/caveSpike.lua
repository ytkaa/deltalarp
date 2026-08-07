local caveSpike, super = Class(Encounter)

function caveSpike:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    if Game:getFlag("isCarryingTreasure") then
        self.text = "* Spike and Kipkip try to nab your treasure! Also, you're overencumbered."
    else
        self.text = "* Spike and Kipkip ambush you!"
    end

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
    Game.world.music:fade(0, 0.1)
    if Game:getFlag("isCarryingTreasure") then
        Game.music:play("soil_treasure")
    else
        Game.music:play("soil_theme")
    end
end

return caveSpike