local Sublevel4inflamedKipkip, super = Class(Encounter)

function Sublevel4inflamedKipkip:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* A deadly gauntlet stands before you!"

    -- Battle music ("battle" is rude buster)
    Game.music:stop()
    self.music = "metal_battle"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("inflamedkipkip")
    self:addEnemy("spike")
end

function Sublevel4inflamedKipkip:onBattleEnd()
    Game.music:stop()
    Game.world.music:fade(0, 0.1)
    if Game:getFlag("isCarryingTreasure") then
        Game.music:play("metal_treasure")
    else
        Game.music:play("metal_theme")
    end
end

return Sublevel4inflamedKipkip