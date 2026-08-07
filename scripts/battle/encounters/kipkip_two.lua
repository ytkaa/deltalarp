local Kipkip_two, super = Class(Encounter)

function Kipkip_two:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Kipkips sprout from the ground!"

    -- Battle music ("battle" is rude buster)
    self.music = "petal_limiter"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
end

return Kipkip_two