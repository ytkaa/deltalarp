local Colonel, super = Class(Encounter)

function Colonel:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Colonel stands their ground!"

    -- Battle music ("battle" is rude buster)
    self.music = "racerb4"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("colonel")
end

return Colonel