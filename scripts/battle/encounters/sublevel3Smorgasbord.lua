local sublevel3Smorgasbord, super = Class(Encounter)

function sublevel3Smorgasbord:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* You might be cooked."

    -- Battle music ("battle" is rude buster)
    Game.music:stop()
    self.music = "metal_battle"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("fleecebug")
    self:addEnemy("kipkip")
    self:addEnemy("spike")
end

function sublevel3Smorgasbord:onBattleEnd()
    Game.music:stop()
    Game.world.music:fade(0, 0.1)
    if Game:getFlag("isCarryingTreasure") then
        Game.music:play("metal_treasure")
    else
        Game.music:play("metal_theme")
    end
end

return sublevel3Smorgasbord