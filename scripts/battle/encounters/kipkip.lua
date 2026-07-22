local Kipkip, super = Class(Encounter)

function Kipkip:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Kipkip sprouts from the ground!"

    -- Battle music ("battle" is rude buster)
    self.music = "petal_limiter"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
end

return Kipkip