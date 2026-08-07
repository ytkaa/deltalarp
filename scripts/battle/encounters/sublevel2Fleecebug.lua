local Sublevel2Fleecebug, super = Class(Encounter)

function Sublevel2Fleecebug:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    if Game:getFlag("isCarryingTreasure") then
        self.text = "* Fleecebug approaches carefully. Also, you're overencumbered."
    else
        self.text = "* Fleecebug approaches carefully."
    end

    -- Battle music ("battle" is rude buster)
    Game.music:stop()
    self.music = "grass_battle"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("fleecebug")
end

function Sublevel2Fleecebug:onBattleEnd()
    Game.music:stop()
    Game.world.music:fade(0, 0.1)
    if Game:getFlag("isCarryingTreasure") then
        Game.music:play("grass_treasure")
    else
        Game.music:play("grass_theme")
    end
end

return Sublevel2Fleecebug