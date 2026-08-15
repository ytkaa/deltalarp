local kipkip_robbers, super = Class(Encounter)

function kipkip_robbers:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Kipkips are here to rob you!"

    -- Battle music ("battle" is rude buster)
    self.music = "petal_limiter"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
    self:addEnemy("kipkip")
end

return kipkip_robbers