local Sublevel3Spike, super = Class(Encounter)

function Sublevel3Spike:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    if Game:getFlag("isCarryingTreasure") then
        self.text = "* Fleecebug and Spike drop in. Also, you're overencumbered."
    else
        self.text = "* Fleecebug and Spike drop in."
    end

    -- Battle music ("battle" is rude buster)
    Game.music:stop()
    self.music = "tile_battle"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("fleecebug")
    self:addEnemy("spike")
end

function Sublevel3Spike:onBattleEnd()
    Game.music:stop()
    Game.world.music:fade(0, 0.1)
    if Game:getFlag("isCarryingTreasure") then
        Game.music:play("tile_treasure")
    else
        Game.music:play("tile_theme")
    end
end

return Sublevel3Spike