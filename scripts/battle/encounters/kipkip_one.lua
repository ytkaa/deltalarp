local Kipkip_one, super = Class(Encounter)

function Kipkip_one:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Kipkips sprout from the ground!"

    -- Battle music ("battle" is rude buster)
    self.music = "racerb4"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
end

return Kipkip_one