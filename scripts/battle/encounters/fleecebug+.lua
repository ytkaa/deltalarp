local Fleecebug, super = Class(Encounter)

function Fleecebug:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Fleecebug and Kipkip ambush you!"

    -- Battle music ("battle" is rude buster)
    self.music = "petal_limiter"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("fleecebug")
    self:addEnemy("kipkip")
end

return Fleecebug